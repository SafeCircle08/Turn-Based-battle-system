//image_angle = clamp(image_angle, firstImageAngle, finalDegree + firstImageAngle)

if (timer > 0)
{	
	if face == "vertical"
	{
		if (y > room_width / 2) 
		{ 
			image_angle = 90;
			firstImageAngle = image_angle;
		}
		else
		{
			image_angle = 270;
			firstImageAngle = image_angle;
		}
	}
	else
	{
		if (x > room_width / 2)
		{
			image_angle = 180;
			firstImageAngle = image_angle;
		}
		else
		{
			image_angle = 0;
			firstImageAngle = image_angle;
		}
	}	
	timer = -1;
}

if (reached == false)
{
	if (image_angle < finalDegree + firstImageAngle)
	{	
		image_angle += 30;
	}
	if (x < targetX) { x+=5; }
	else { x-=5; }
	if (y < targetY) { y+=5 }
	else { y-= 5 }
}

if (x == targetX) && (y = targetY)
{
	reached = true;
	actualTimer = setTimer(actualTimer);
	image_angle = firstImageAngle;
	
	if (actualTimer == 0)
	{
		oShake.shake = true;
		with instance_create_layer(x, y, LAYER_BULLETS, oBlasterBeam)
		{
			image_angle = other.firstImageAngle
		}
		actualTimer = -1;
	}
}
if (actualTimer = -1)
{
	actualGoBackTimer = setTimer(actualGoBackTimer);
	if (actualGoBackTimer == 0)
	{
		if (x < xstart) { x+=5; }
		else { x-=5; }
		if (y < ystart) { y+=5 }
		else { y-=5; }
		firstImageAngle -= 10;
		image_angle = firstImageAngle;
		if (x == xstart) && (y == ystart) { instance_destroy(self); }
	}
}