reduceAlphaTimer = setTimer(reduceAlphaTimer);

if (reduceAlphaTimer == 0)
{
	vspeed = 0;
	hspeed = 0;
	gravity = 0;
	
	reduceAlpha(id, 0.05);	
}
else
{
	image_alpha += 0.05;
	image_angle -= 1;	
}