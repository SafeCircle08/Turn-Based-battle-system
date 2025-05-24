frame += 0.2;

if (image_xscale > 0 && image_yscale > 0)
{
	image_xscale -= 0.5 * frame;
	image_yscale -= 0.5 * frame;
}

if (image_xscale <= 0 || image_yscale <= 0) { instance_destroy(self); }