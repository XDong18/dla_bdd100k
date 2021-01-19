import torch
from collections import OrderedDict

origin_model_path = './out/dla34_up_768x768_bs8_500e_new_pretrained/model_best.pth.tar'
new_model_path = '/shared/xudongliu/code/f_server/mmsegmentation/out/dla_model/dla34_bs16_500e_new_pretrained.pth'
meta_path = '/shared/xudongliu/code/f_server/mmsegmentation/out/dla34up_80k_new_sbn/latest.pth'

meta = torch.load(meta_path)['meta']
model = torch.load(origin_model_path)

state_dict = model['state_dict']
new_state_dict = OrderedDict()

for k, v in state_dict.items():
    if k[:6] == 'module':
        new_k = [k[7:]]
    if 'base.fc' in new_k:
        continue
    prefix, module = new_k.split('.', 1)
    if prefix == 'base':
        new_prefix = 'backbone'
    elif prefix == 'dla_up':
        new_prefix = 'neck'
    elif prefix == 'fc':
        postfix = new_k.split('.')[-1]
        new_state_dict['decode_head.conv_seg.' + postfix] = v
        continue

    new_state_dict[new_prefix + '.' + module] = v

new_model = model 
new_model['state_dict'] = new_state_dict
new_model['meta'] = meta
torch.save(new_model, new_model_path)


