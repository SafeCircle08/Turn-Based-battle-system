image_angle += 20;
image_xscale -= 0.05;
image_yscale -= 0.05;

if (image_xscale <= 0) { instance_destroy(self); }