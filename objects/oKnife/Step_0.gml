if (image_alpha < 1)
{
	frame += 0.5;
	image_alpha += 0.05;
	if (image_angle > goalDir)
	{
		image_angle -= 1 * frame; 
	}	
	else
	{
		image_angle += 1 * frame;
	}
}

if (image_alpha == 1)
{
	timer++;
	if (timer == 1)
	{
		instance_create_layer(x, y, "ExtrasObjects", oStarShine);
	}
	if (launched == true)
	{
		var _slash = instance_create_layer(x, y, "Bullets", oSlash);
		_slash.image_angle = goalDir;
		_slash.image_xscale = 4;
		_slash.image_yscale = 0.5;
		instance_destroy(self);
	}
}