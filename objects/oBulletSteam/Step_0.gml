event_inherited();

image_alpha = clamp(image_alpha, 0, 1)

if (y < global.boxOriginY - (global.borderHeight / 2))
{
	image_alpha -= 0.05;
	if (image_alpha <= 0) { instance_destroy(self); }
	exit;
}

image_alpha += 0.05