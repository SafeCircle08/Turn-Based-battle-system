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
	if (oBattleManager.playerTurn == false)
	{
		destroyBulletsGensExtras();
		with (oBattleManager)
		{
			ds_messages = ds_list_create();
			ds_messages[| 0] = "<>Turn ended.";
			ds_messages[| 1] = "<>The Fight continues.";
			selected_option = 0;
			enemyTextShowed = true;
			showBattleText = true;
			oBattleBox.visible = false;
			global.enemyTimer = 0;
			global.playerShield = global.playerMaxShield;
			turnNumber += 1;
			actualDrawAlpha = 0;
			defended = 0;
		}
	}
}