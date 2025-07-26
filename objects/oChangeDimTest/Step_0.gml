if (isDistant()) { exit; }
fxTimer = setTimer(fxTimer);

if (fxTimer == 0)
{
	makeAlphaListEffect(sprite_index, 0.8, 0.02, 1, 0, x, y, "Effects");
	fxTimer = 20;
}