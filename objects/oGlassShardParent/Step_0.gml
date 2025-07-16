fallTimer = setTimer(fallTimer);

if (fallTimer == 0)
{
	gravity = 0.3;
	vspeed = refVSP;
	hspeed = irandom_range(-2, 2);
	x += choose(-3, 3);
	y += choose(-3, 3);
	fallTimer = -1;
}

if (fallTimer == -1)
{
	createTimer = setTimer(createTimer);
	if (createTimer == 0)
	{
		var _offset = 10;
		var _x = x + irandom_range(-_offset, _offset);
		var _y = y + irandom_range(-_offset, _offset);
		instance_create_layer(_x, _y, "GlassWallShards", oSparkGlassFX);
		createTimer = 5;
	}
}

outSideWindow(self, image_index);