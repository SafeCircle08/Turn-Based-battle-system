function playerInfo()
{
	//General info:
	global.playerName = "Misery";
	global.playerMAX_HP = 512;
	global.playerHP = 511;
	global.playerShield = 50;
	global.playerMaxShield = 50;
	global.CSvalue = 100;	//CAGE STATE
	global.CSvalueMax = 100;
	global.playerAttackTimer = 300; //5 seconds
	global.playerAttackTime = 0;
	
	//----------------------------VARIABILI GLOBALI---------------------------------------------------
	global.SoulSpeed = 2;
	global.defenceValue = undefined;
	global.attackRandom = undefined; //VALORE AGGIUNTIVO A GLOBAL.BULLETATK (RENDERE I DANNI VARIABILI)
	//Variabili per spostare il player 
	//(non farlo spawnare sempre al centro del box)
	global.xOffset = 0;
	global.yOffset = 0;
	global.playerMoveTimer = 65;
	global.beamAnimation = false;	
	
	//Weapons Info:	
	global.eqDrumPad = oDrumPad;
	global.eqScope = oDrumPadScope;
}

//Initialize all the player variables:
playerInfo();