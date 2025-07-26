if (room != Room_Battle)
{
	if (isDistant()) { exit; }
}

if (sining)
{
	if (startImageAlpha == noone)
	{
		startImageAlpha = image_alpha;	
	}
	if (attached == false)
	{
		x = xstart + cos(timerValue) * amplitude;
	}
	else if (instance_exists(oBattleManager)) 
	{ 
		battleGUIFunction();
	}
	timerValue += frequence;
	image_alpha = abs(sin(frame));
	image_alpha = clamp(image_alpha, 0, startImageAlpha);
}
else
{
	image_alpha = abs(sin(frame));
	image_alpha = clamp(image_alpha, 0, 1);
}

frame += 0.01;