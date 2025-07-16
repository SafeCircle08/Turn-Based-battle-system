reduceAlphaTimer = setTimer(reduceAlphaTimer);

if (reduceAlphaTimer == 0)
{
	vspeed = 0;
	hspeed = 0;
	gravity = 0;
	
	reduceAlpha(oGoodJumpEffect, 0.05);	
}
else
{
	image_angle -= 1;	
}