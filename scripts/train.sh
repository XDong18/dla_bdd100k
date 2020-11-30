export CUDA_VISIBLE_DEVICES=0,1,2,3
python3 segment.py train -d /shared/xudongliu/bdd100k/seg/seg -c 19 -s 768 --arch dla34up \
    --batch-size 8 --lr 0.01 --momentum 0.9 --lr-mode poly \
    --epochs 500 --bn-sync --random-scale 2 --random-rotate 0 \
    --random-color --pretrained-base imagenet -o out/dla34_up_768x768_500e  --resume out/dla34_up_768x768_500e/checkpoint_164.pth.tar