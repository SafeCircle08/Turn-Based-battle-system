//Creates the specifis generator
if (oBattleManager.playerTurn == false)
{
	if (generatorCreated == false)
	{
		var _actualGenerator = global.inUseGenerator[oBattleManager.turnNumber];
		instance_create_layer(x, y, "BattleBoxBgs", _actualGenerator);
		generatorCreated = true;
	}
}
//ONLY FOR DEBUGGING---------(skippa il turno)------------
if keyboard_check_pressed(ord("R")) 
{ 
	finishTurn(); 
	destroyBulletsGensExtras();
	global.playerShield = global.playerMaxShield;
}