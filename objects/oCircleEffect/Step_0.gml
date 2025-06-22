frame += 0.2;

if (image_xscale > 0 && image_yscale > 0)
{
	image_xscale -= 0.5 * frame;
	image_yscale -= 0.5 * frame;
	image_alpha -= 0.01;
}

if (image_xscale <= 0 || image_yscale <= 0) { instance_destroy(self); }
