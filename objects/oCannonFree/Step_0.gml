image_angle = clamp(image_angle, firstImageAngle, finalDegree + firstImageAngle)

if (reached == false)
{
	if (image_angle < finalDegree + firstImageAngle)
	{	
		image_angle += 20
	}
	if (x < targetX) { x+=5 }
	if (x > targetX) { x-=5 }
	if (y < targetY) { y+=5 }
	if (y > targetY) { y-=5 }
}

if (x == targetX) && (y == targetY)
{
	image_angle = firstImageAngle;
	reached = true;
	if (actualTimer > 0) { actualTimer-- }
	
	if (actualTimer == timer - 1)
	{ 
		gettingPower = instance_create_layer(x, y, LAYER_EFFECT, oCannonAcquiring);
		gettingPower.image_angle = firstImageAngle;
		gettingPower.image_speed = 0.7;
	}
	
	if (actualTimer == 0)
	{
		instance_destroy(gettingPower);
		oShake.shake = true;
		with instance_create_layer(x, y, LAYER_BULLETS, oBlasterBeamSmall)
		{
			image_angle = other.firstImageAngle
		}
		actualTimer = -1;
	}
}

if (actualTimer == -1)
{
	if (actualGoBackTimer > 0) { actualGoBackTimer-- }
	if (actualGoBackTimer == 0)
	{
		{
			if (x < xstart) { x+=5 }
			if (x > xstart) { x-=5 }
			if (y < ystart) { y+=5 }
			if (y > ystart) { y-=5 }
			image_angle += 20
		}
	}
	outSideWindow(self, sCannon);
}