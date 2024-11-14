event_inherited();

steamDownBullets =
[
	oBulletSteamDown,
	[205, 190, 175, 160, 145],
	global.border_u - 12,
	noone,
];

if (global.created == false)
{
	if (global.createTimer > 0) { global.createTimer-- };
	
	if (global.createTimer == 0)
	{			
		for (var i = 0; i < 5; i++)
		{
			var _actualBullet = global.bulletsCreated;
			instance_create_layer(steamDownBullets[1][i], steamDownBullets[2], "Bullets", oBulletSteamDown);
			global.bulletsCreated++;
		}	
	}
	if (global.bulletsCreated == 5) { global.created = true };	
}
