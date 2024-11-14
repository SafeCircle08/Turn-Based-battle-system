event_inherited();

if (global.created == false)
{
	for (var i = 0; i < 2; i++)
	{
		instance_create_layer(global.bulletKind[5][1][i], global.bulletKind[5][2][i], "Bullets", oDocumentBullet);	
		global.created = true;
	}
}

