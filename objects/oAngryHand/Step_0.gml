image_xscale = clamp(image_xscale, 0, 1);
image_yscale = clamp(image_yscale, 0, 1);
image_alpha += 0.05;

if (image_xscale >= 0.5)
{
	if (reachedSpeed == false)
	{
		image_speed = 1;
		reachedSpeed = true;
	}
	
	if (image_index == 2) { oSoul.image_alpha = 0; }
	
	if (image_index >= image_number -1) 
	{
		if (image_speed != 0)
		{
			hitPlayer(50);
			image_speed = 0; 
		}
		xAdder = irandom_range(-1, 1);
		yAdder = irandom_range(-1, 1);
		x += xAdder;
		y += yAdder;
		x = clamp(x, xstart - 1, xstart + 1);
		y = clamp(y, ystart - 1, ystart + 1);
	}
	exit;
}

if (image_xscale < maxScaleX)
{
	image_xscale += ((1.7 - image_xscale) / 4)
}	
if (image_xscale > maxScaleX)
{
	image_xscale -= ((1.7 - image_xscale) / 4)
}
if (image_yscale < maxScaleY)
{
	image_yscale += ((1.7 - image_yscale) / 4) 
}
if (image_yscale > maxScaleY)
{
	image_yscale -= ((1.7 - image_yscale) / 4) 
}