//CREA IL GENERATORE DEL TURNO ATTUALE
if (oBattleManager.playerTurn == false)
{
	if (generatorCreated == false)
	{
		var _actualGenerator = global.inUseGenerator[oBattleManager.turnNumber - 1];
		instance_create_layer(x, y, "BattleBoxBgs", _actualGenerator);
		generatorCreated = true;
	}
}

//ANIMAZIONE PLAYER E "RESET" DEGLI ATTACCHI
if (global.enemyTimer == global.enemyAttackTime - 60)
{
	#region ANIMAZIONE "BEAM DEL PLAYER"
	global.playerMoveTimer = 60;
	indexMax = 0;
	oSoul.canShow = false;
	oBattleBox.returnAnimation = true;
	#endregion
	//DISTRUGGE GLI OGGETTI (I BULLETS E I GENERATORS ED EXTRAS) ALLA FINE DEL TURNO
	if (instance_exists(oBulletParent)) { instance_destroy(oBulletParent); }
	if (instance_exists(oBulletGeneratorParent)) { instance_destroy(oBulletGeneratorParent); }
	if (instance_exists(oExtrasParent)) { instance_destroy(oExtrasParent); }
}

//ONLY FOR DEBUGGING---------(skippa il turno)------------
if keyboard_check(ord("R"))
{
	#region ANIMAZIONE "BEAM DEL PLAYER"
	global.playerMoveTimer = 60;
	global.enemyAttackTime = 61;
	indexMax = 0;
	oSoul.canShow = false;
	#endregion
	//DISTRUGGE GLI OGGETTI (I BULLETS E I GENERATORS ED EXTRAS) ALLA FINE DEL TURNO
	if (instance_exists(oBulletParent)) { instance_destroy(oBulletParent); }
	if (instance_exists(oBulletGeneratorParent)) { instance_destroy(oBulletGeneratorParent); }
	if (instance_exists(oExtrasParent)) { instance_destroy(oExtrasParent); }		
}