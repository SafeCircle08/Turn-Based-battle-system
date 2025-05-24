image_alpha -= 0.05;
if (image_xscale && image_yscale < maxScaleXY)
{
	image_xscale += scaleAdder;
	image_yscale += scaleAdder;
}

if (image_alpha <= 0) { instance_destroy(self); }