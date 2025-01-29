image_angle = clamp(image_angle, firstImageAngle, finalDegree + firstImageAngle)

if (reached == false)
{
	if (image_angle < finalDegree + firstImageAngle)
	{	
		image_angle += 60
	}
	if (x < targetX) { x+=5 }
	if (x > targetX) { x-=5 }
	//if (y < targetY) { y+=5 }
	//if (y > targetY) { y-=5 }
}


if (x == targetX) //and (y = targetY)
{
	reached = true;
	if (timer > 0) { timer-- }
	
	if (timer % 5 == 0) { image_index++ }
	
	if (timer == 0)
	{
		oShake.shake = true;
		with instance_create_layer(x, y, "Bullets", oBlasterBeam)
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
			//if (y < ystart) { y+=5 }
			//if (y > ystart) { y-=5 }
			image_angle-=10
			
			if (x == xstart) { instance_destroy(self); show_debug_message("Distrutto"); }
			
		}
	}
}