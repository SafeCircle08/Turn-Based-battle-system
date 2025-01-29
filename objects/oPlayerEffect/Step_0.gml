frame += 5.2;

x = oSoul.x;
y = oSoul.y;

if (image_xscale < maxScaleX)
{
	image_xscale += ((1.2 - image_xscale) / 2) + 0.2
}	
if (image_xscale > maxScaleX)
{
	image_xscale -= ((1.2 - image_xscale) / 2) + 0.2
}
if (image_yscale < maxScaleY)
{
	image_yscale += ((1.2 - image_yscale) / 2) + 0.2
}
if (image_yscale > maxScaleY)
{
	image_yscale -= ((1.2 - image_yscale) / 2) + 0.2
}

image_alpha -= 0.02;

if (image_alpha <= 0) { instance_destroy(self) }