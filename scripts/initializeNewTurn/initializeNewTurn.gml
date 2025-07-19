//Initializing the turn with the beam animation
function initializeNewTurn(createT, created, timer, bltCreated, bW, bH, bX, bY, _playerState)
{
	startBeamAnimation();
	genTimeVars(createT, created, timer, bltCreated);
	boxDimensions(bW, bH);
	setBoxOrigin(bX, bY);
	playerSetState(_playerState);
}

function destroyBulletsGensExtras()
{
	if (instance_exists(oBulletParent)) { instance_destroy(oBulletParent); }
	if (instance_exists(oBulletGeneratorParent)) { instance_destroy(oBulletGeneratorParent); }
	if (instance_exists(oExtrasParent)) { instance_destroy(oExtrasParent); }		
}

//used to finish a turn, by creating the beam animation
function finishTurn()
{	
	with (oBattleManager)
	{
		if (!ds_exists(ds_messages, ds_type_list)) { ds_messages = ds_list_create(); }
		ds_messages[| 0] = "The monster has finished his attack."	
		battleOption = 0;			
		oBattleBox.visible = false;
		showBattleText = true;
		global.enemyTimer = 0;
		turnNumber += 1;
		actualDrawAlpha = 0;
		defended = 0;
	}	
}