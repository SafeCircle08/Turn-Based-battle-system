image_alpha = clamp(image_alpha, -1, 1);
image_alpha -= 0.05;
if (image_alpha < 0) { instance_destroy(self); }