event_inherited();

image_angle += 10;
image_alpha -= 0.005;

outSideWindow(self, sSpark);
if (image_alpha <= 0) { instance_destroy(self); }