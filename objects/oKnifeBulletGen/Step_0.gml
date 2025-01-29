event_inherited();

var _tubesCoord = 
[
	//X pos
	[global.border_l, global.border_r, global.border_l, global.border_r],
	//Y pos
	[global.border_d - 20, global.border_d - 40, global.border_d - 60, global.border_d - 80],
];


if (global.created == false)
{
	if (global.createTimer > 0) { global.createTimer-- };
	
	if (global.createTimer == 0)
	{
		var _actualBullet = global.bulletsCreated;
		instance_create_layer(_tubesCoord[0][_actualBullet], _tubesCoord[1][_actualBullet], "Bullets", global.bulletKind[3][0][_actualBullet]);
		global.createTimer = 30;
		global.bulletsCreated++;
	}
	
	if (global.bulletsCreated == 4) 
	{
		global.bulletsCreated = 0;
		instance_create_layer(160, 53, "Bullets", oBulletSteamDown);
		instance_create_layer(160, 53, "Bullets", oExclamationMark);
		audio_play_sound(sndExclamation, 50, false);
	};
}

