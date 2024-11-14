event_inherited();

if (global.created == false)
{
	if (global.createTimer > 0) { global.createTimer-- };
	
	if (global.createTimer == 0)
	{
		var _actualBullet = global.bulletsCreated;
		instance_create_layer(global.bulletKind[3][1][_actualBullet], global.bulletKind[3][2][_actualBullet], "Bullets", global.bulletKind[3][0][_actualBullet]);
		global.createTimer = 30;
		global.bulletsCreated++;
	}
	
	if (global.bulletsCreated == 4) 
	{
		global.bulletsCreated = 0;
		instance_create_layer(160, 53, "Bullets", oBulletSteamDown);
	};
}

