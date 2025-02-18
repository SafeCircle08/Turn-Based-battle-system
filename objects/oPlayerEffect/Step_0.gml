image_alpha -= 0.02;

if (image_alpha <= 0) { instance_destroy(self) }

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