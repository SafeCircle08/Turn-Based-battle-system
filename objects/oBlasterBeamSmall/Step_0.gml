if (energyTimer > 0)
{
	energyTimer--;
	if (image_xscale < maxScaleX)
	{
		image_xscale += ((70 - image_xscale) / 15)	
	}
}

if (energyTimer == 0) 
{ 
	image_alpha -= 0.03 
}

if (image_alpha < 0) 
{
	instance_destroy();	
}

if (image_yscale < maxScaleY)
{
	image_yscale += ((2 - image_yscale) / 2)	
}
if (image_yscale > maxScaleY)
{
	image_yscale -= ((1.5 - image_yscale) / 2)	
}	