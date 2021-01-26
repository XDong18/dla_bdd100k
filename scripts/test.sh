export CUDA_VISIBLE_DEVICES=2,3,4,5,6,7,8,9
python3 segment.py test --phase val -d /shared/xudongliu/bdd100k/seg/seg -c 19 -s 1280 --arch dla34up \
    --batch-size 8 \
    --epochs 500 --bn-sync \
    --with-gt \
    -e --resume out/dla34_up_768x768_16_500e/model_best.pth.tar