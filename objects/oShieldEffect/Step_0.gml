frame += 0.15;
if (timer >= 0)
{
	image_alpha += 0.08;
	timer--;
}
else
{
	oBattleManager.showBattleText = true;
	image_alpha = clamp(image_alpha, -1, 1);
	image_alpha -= 0.05;
	if (image_alpha <= 0) { instance_destroy(self);  }
}

if (white_alpha < 1 && flashed == false) { white_alpha += 0.1; }
if (white_alpha == 1) { flashed = true; }
if (flashed == true) { white_alpha -= 0.1; }

white_alpha = clamp(white_alpha, 0, 1);