event_inherited();

if (global.enemyTimer % 100) == 0
{
	cannonHorizontal.createBlaster = true;
}

if (global.enemyTimer == 600)
{
	var _xx = global.boxOriginX;
	var _docX = [_xx - 50, _xx, _xx + 50];
	var _docY = global.boxOriginY + 90;
	createExclamationMarks();
	boxDimensions(170, 150);
	for (var i = 0; i < 3; i++)
	{
		instance_create_layer(_docX[i], _docY, "Bullets", oDocumentBullet);	
	}
}

if (instance_exists(oDocumentBullet)) { oDocumentBullet.canCreate = false; }

if (keyboard_check_pressed(vk_space)) { playerChangeState(oSoul.stateFree, sNoEffects); }