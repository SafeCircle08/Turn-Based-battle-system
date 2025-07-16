if (image_xscale < 0.5)
{
	image_xscale += 0.04;
}


if (timerToGetCoord > 0)
{
	takingX = oSoul.x;
	takingY = oSoul.y;
	image_angle = point_direction(self.x, self.y, takingX, takingY);
	timerToGetCoord--;
}

if (timerToGetCoord == 0)
{
	var _finalX = takingX;
	var _finalY = takingY;
	frame += 0.005;
	
	image_angle = point_direction(self.x, self.y, _finalX, _finalY);
	move_towards_point(_finalX, _finalY, moveSpd * frame);
	
	if (point_distance(self.x, self.y, _finalX, _finalY) < 2) && (disapperTimer > 0)
	{
		speed = 0;
		image_xscale = 1.5;
		image_yscale = 1.5;
		timerToGetCoord = -1;
	}
}

if (timerToGetCoord = -1)
{
	disapperTimer = setTimer(disapperTimer);
	if (disapperTimer == 0)
	{
		image_xscale -= 0.1;
		if (image_xscale <= 0) { instance_destroy(self) }
	}
}

canCreateTimer = setTimer(canCreateTimer);
if (canCreateTimer == 0) && (canCreate == true)
{
	var _sign = irandom_range(-5, 5); 
	
	while _sign == 0 { _sign = irandom_range(-5, 5); } 
	var _xx = oSoul.x + 120 * sign(_sign);
	var _yy = oSoul.y + 70 * sign(_sign)
	instance_create_layer(_xx, _yy, LAYER_BULLETS, oDocumentBullet);
	canCreateTimer = -1;
}
