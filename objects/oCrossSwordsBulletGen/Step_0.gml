event_inherited();

global.crossSwordPattern = 
[
	[
		[oBulletSteam, oBulletSteamDown, oBulletSteamLeft, oBulletSteamRight],
		[oBulletSteam, oBulletSteamDown, oBulletSteamLeft, oBulletSteamRight],
		[oBulletSteam, oBulletSteamDown, oBulletSteamLeft, oBulletSteamRight],
	],
	[
		[oSoul.x, oSoul.x, oSoul.x + 50, oSoul.x - 50],
		[oSoul.x, oSoul.x, oSoul.x + 50, oSoul.x - 50],
		[oSoul.x, oSoul.x, oSoul.x + 50, oSoul.x - 50],
	],
	[
		[oSoul.y + 50, oSoul.y - 50, oSoul.y, oSoul.y],
		[oSoul.y + 50, oSoul.y - 50, oSoul.y, oSoul.y],
		[oSoul.y + 50, oSoul.y - 50, oSoul.y, oSoul.y],
	],
];

if (global.created == false)
{
	if (global.createTimer > 0) { global.createTimer-- };
	
	if (global.createTimer == 0)
	{	
		for (var i = 0; i < 4; i++)
		{	
			var _actualBullet = global.bulletsCreated;
			instance_create_layer
			(
				global.crossSwordPattern[1][_actualBullet][i], 
				global.crossSwordPattern[2][_actualBullet][i],
				"Bullets",
				global.crossSwordPattern[0][_actualBullet][i]	
			);	
			if (i == 3) { global.bulletsCreated++; global.createTimer = 80; } 
	}
	if (global.bulletsCreated == 2) { global.bulletsCreated = 0; instance_create_layer(oSoul.x + choose( -70, 70), oSoul.y + choose(-90, 90), "Bullets", oDocumentBullet); }
	}	
}