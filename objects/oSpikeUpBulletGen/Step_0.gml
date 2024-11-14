event_inherited();

steamUpBullet =
[
		oBulletSteam,
		[115, 130, 145, 160, 175], //x Coord;
		global.border_d + 12, //y Coord
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
			instance_create_layer(steamUpBullet[1][i], steamUpBullet[2], "Bullets", oBulletSteam);
			global.bulletsCreated++;
		}	
	}
	if (global.bulletsCreated == 5) { global.created = true };	
}