export CUDA_VISIBLE_DEVICES=4,5
python3 segment.py test --phase test -d /shared/xudongliu/bdd100k/seg/seg -c 19 -s 1280 --arch dla34up \
    --batch-size 2 --lr 0.01 --momentum 0.9 --lr-mode poly \
    --epochs 500 --bn-sync --random-scale 2 --random-rotate 0 \
    --random-color --pretrained-base imagenet -o vis_out/dla34_up_768x768_16_500e_test  -e --resume out/dla34_up_768x768_16_500e/model_best.pth.tar