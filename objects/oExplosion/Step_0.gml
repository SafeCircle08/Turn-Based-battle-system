frame += 0.1;
y -= 1 * frame;
image_alpha -= 0.008;
if (image_alpha <= 0) { instance_destroy(self); }