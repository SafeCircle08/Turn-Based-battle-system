event_inherited();

if (global.created == false)
{
	var _xx = global.bulletKind[5][1][global.bulletsCreated];
	var _yy = global.bulletKind[5][2][global.bulletsCreated];
	createBullets(_xx, _yy, "Bullets", oDocumentBullet, 0, 2, true)
}

