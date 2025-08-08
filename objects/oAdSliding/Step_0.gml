speedTimer = setTimer(speedTimer);

if (speedTimer > 0)
{
	if (instance_exists(fadeInOutAnimationsParent))
	{
		x += xSpd * 30;
		y += ySpd * 30;
	}
}
else
{
	x += xSpd;
	y += ySpd;
}

print(speedTimer)

if (!instance_exists(fadeInOutAnimationsParent))
{
	if (xSpd == 0) 
	{
		horizontalOutro();
	}
	moveInTimer = setTimer(moveInTimer);
	if (moveInTimer == 0)
	{
		xSpd *= -7;
		moveInTimer = -1;
	}
	if (moveInTimer == -1) { changeAlpha(self, 0, 0.05, true); }
}
