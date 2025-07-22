if (isDistant()) { exit; }
if (sining)
{
	if (startImageAlpha == noone)
	{
		startImageAlpha = image_alpha;	
	}
	x = xstart + cos(timerValue) * amplitude;
	image_alpha = abs(sin(frame));
	image_alpha = clamp(image_alpha, 0, startImageAlpha);
	timerValue += frequence;
}
else
{
	image_alpha = abs(sin(frame));
	image_alpha = clamp(image_alpha, 0, 1);
}

frame += 0.01;