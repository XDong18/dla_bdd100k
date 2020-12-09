import os

img_dir = 'vis_out/dla34_up_768x768_16_500e/dla34up_148_val_color/images/val'
img_list = sorted(os.listdir(img_dir))
out_fn = 'vis_out/dla34_up_768x768_16_500e_148_val.html'
with open (out_fn, 'w') as f:
    f.write('<html>\n')
    f.write('<body>\n')
    f.write('<h1>dla34_up_768x768_16_500e_148_val</h1>\n')

    for i, img in enumerate(img_list):
        name = "<p>" + str(i) + ' ---- ' + img + "</p>\n"
        f.write(name)
        new_line = "<img src='" + os.path.join('dla34_up_768x768_16_500e/dla34up_148_val_color/images/val', img) + "'>\n"
        f.write(new_line)

    # f.write("<img src='" + "test.jpg" + "'>\n")
    f.write('</body>\n')
    f.write('</html>\n')
