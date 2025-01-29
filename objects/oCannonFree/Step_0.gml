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

if (x == targetX) and (y == targetY)
{
	image_angle = firstImageAngle;
	reached = true;
	if (timer > 0) { timer-- }
	
	if (timer % 5 == 0) { image_index++ }
	
	if (timer == 0)
	{
		oShake.shake = true;
		with instance_create_layer(x, y, "Bullets", oBlasterBeamSmall)
		{
			image_angle = other.firstImageAngle
		}
		timer = -1;
	}
}

if (timer = -1)
{
	if (goBackTimer > 0) { goBackTimer-- }
	if (goBackTimer == 0)
	{
		{
			if (x < xstart) { x+=5 }
			if (x > xstart) { x-=5 }
			if (y < ystart) { y+=5 }
			if (y > ystart) { y-=5 }
			image_angle+=20
		}
	}
	if (x < -50 || x > room_width + 50) || (y < 0 - 50|| y > room_height + 50)
	{
		instance_destroy(self) 
	}
}