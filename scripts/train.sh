export CUDA_VISIBLE_DEVICES=0,1,8,9
python3 segment.py train -d /shared/xudongliu/bdd100k/seg/seg -c 19 -s 768 --arch dla102up \
    --batch-size 8 --lr 0.005 --momentum 0.9 --lr-mode poly \
    --epochs 500 --bn-sync --random-scale 2 --random-rotate 0 \
    --random-color --pretrained-base imagenet -o out/dla102_up_768x768_bs8_500e_new_pretrained \
    --resume out/dla102_up_768x768_bs8_500e_new_pretrained/checkpoint_391.pth.tar