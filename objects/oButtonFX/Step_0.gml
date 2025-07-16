image_xscale += 0.03;
image_yscale += 0.03;
image_alpha -= 0.05;

if (image_alpha <= 0) { instance_destroy(self); }