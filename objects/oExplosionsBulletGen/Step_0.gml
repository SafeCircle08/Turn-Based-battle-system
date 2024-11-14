event_inherited();

var _xx = global.boxOriginX;
var _yy = global.boxOriginY;

var _explosions =
[
	[_xx - 100, _xx + 100, _xx, _xx],
	[_yy, _yy, _yy - 200, _yy + 200],
	[oBulletSteamRight, oBulletSteamLeft, oBulletSteamDown, oBulletSteam]
];

if (global.created == false)
{
	if (global.createTimer > 0) { global.createTimer-- };
	
	if (global.createTimer == 0)
	{
		instance_create_layer(_explosions[0][global.bulletsCreated], _explosions[1][global.bulletsCreated], "Bullets", _explosions[2][global.bulletsCreated]);
		global.createTimer = 60;
		global.bulletsCreated++;
	}
	if (global.bulletsCreated == 4) {global.bulletsCreated = 0; };	
}