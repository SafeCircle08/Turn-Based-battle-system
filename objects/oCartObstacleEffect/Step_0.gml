image_xscale += 0.05;
image_yscale += 0.05;
image_alpha -= 0.05;

if (image_alpha <= 0) { instance_destroy(self); }

if (instance_exists(callerId))
{
	x = callerId.x;
	y = callerId.y;
}