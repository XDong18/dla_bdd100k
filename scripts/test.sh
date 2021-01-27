export CUDA_VISIBLE_DEVICES=6,7,8,9
python3 segment.py test --phase val -d /shared/xudongliu/bdd100k/seg/seg -c 19 -s 1280 --arch dla34_bilinear \
    --batch-size 4 \
    --epochs 500 --bn-sync \
    --with-gt \
    -e --resume out/dla34_bilinear_up_768x768_bs8_500e_old_pretrained/model_best.pth.tar