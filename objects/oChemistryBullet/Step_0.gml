if (x < global.boxOriginX - (global.borderWidth / 2) - 10)
{
	image_xscale -= 0.005;
	image_yscale -= 0.005;
	if (image_xscale < 0) { instance_destroy(self); }
	exit;
}

if (toMoveTimer > 0) 
{ 
	toMoveTimer--
	x -= 0.5;
}

spd = distance ^ 2;

if (toMoveTimer == 0)
{
	if (shakeTimer > 0)
	{
		shakeTimer--;
		var xShaking = irandom_range(-1, 1);
		var yShaking = irandom_range(-1, 1);
		x += xShaking;
		y += yShaking;
		x = clamp(x, x - 0.3, x + 0.3);
		y = clamp(y, y - 0.3, y + 0.3);
	}
	
	if (shakeTimer == 0)
	{
		image_angle += 2;
		x -= spd;
		distance += 0.05;
	}
}