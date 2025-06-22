if (instance_number(oElectronCircular) < oElectronCircle.maxElectrons) { exit; }
delayTimer = setTimer(delayTimer);

if (delayTimer == 0)
{
	frame += 0.5;
	cosMultiplier = cosMultiplier * 1.1;
	cosMultiplier = clamp(cosMultiplier, 0, 50);
	x = xstart + cos(frame / 20) * cosMultiplier;
	y = ystart + sin(frame / 20) * cosMultiplier;
	image_angle += 5;
}