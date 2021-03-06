export CUDA_VISIBLE_DEVICES=0,1,2,3
python3 segment.py test --phase val -d /shared/xudongliu/bdd100k/seg/seg -c 19 -s 1280 --arch dla102up \
    --batch-size 4 \
    --epochs 500 --bn-sync \
    --with-gt \
    -e --resume out/dla102_up_768x768_bs16_500e/model_best.pth.tar