event_inherited();

var _pos = 
[
	//BULLET KIND 0
	oBullet, //object
	[300, -300],	//x value
	[100, 100], //y value
	noone,
];

if (global.created == false)
{
	var _xx = _pos[1][global.bulletsCreated];
	var _yy = _pos[2][global.bulletsCreated];
	createBullets(_xx, _yy, "Bullets", oBullet, 60, 2, true);
}