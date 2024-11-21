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
	
	image_angle = point_direction(self.x, self.y, _finalX, _finalY);
	move_towards_point(_finalX, _finalY, 1);
	
	if (point_distance(self.x, self.y, _finalX, _finalY) < 2)
	{
		speed = 0;
		image_xscale = 1.5;
		image_yscale = 1.5;
		image_alpha -= 0.02;
		if (image_alpha <= 0) { instance_destroy(self); }
	}
}

if (canCreateTimer > 0) { canCreateTimer--};

if (canCreateTimer == 0) && (canCreate == true)
{
	var _xx = irandom_range(-200, 200);
	var _yy = irandom_range(-75, 75);
	instance_create_layer(oSoul.x + _xx, oSoul.y + _yy, "Bullets", oDocumentBullet);
	canCreate = false;
}
