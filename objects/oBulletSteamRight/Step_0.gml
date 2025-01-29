x++;

image_alpha = clamp(image_alpha, 0, 1)

if (oBattleManager.turnNumber > 12)
{
	if (x > global.boxOriginX - (global.borderWidth / 2))
	{
		if (x == global.boxOriginX + (global.borderWidth/ 2) + 1)	
		{
			instance_change(oBulletSteamRightExp, true);	
		}
	}
}

if (oBattleManager.turnNumber > 12) { exit; }

if (x > global.boxOriginX + (global.borderWidth / 2))
{
	image_alpha -= 0.05;
	if (image_alpha <= 0) { instance_destroy(self); }
	exit;
}

image_alpha += 0.05