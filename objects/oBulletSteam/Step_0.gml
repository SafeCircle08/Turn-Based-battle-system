y--;
image_alpha = clamp(image_alpha, 0, 1)

//Sarebbe meglio fare una variabile singolare della battaglia
if (oBattleManager.turnNumber > 12)
{
	if (y < global.boxOriginY + (global.borderHeight / 2))
	{
		if (y == global.boxOriginY - (global.borderHeight / 2))	
		{
			instance_change(oBulletSteamExp, true);	
		}
	}
}

if (oBattleManager.turnNumber > 12) { exit; }

if (y < global.boxOriginY - (global.borderHeight / 2))
{
	image_alpha -= 0.05;
	if (image_alpha <= 0) { instance_destroy(self); }
	exit;
}

image_alpha += 0.05