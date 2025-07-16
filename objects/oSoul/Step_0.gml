key_right = keyboard_check(ord("D")); 
key_left = keyboard_check(ord("A")); 
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

global.playerHP = clamp(global.playerHP, -666, global.playerMAX_HP);

if (oBattleBox.visible == false) 
{ 
	visible = false;
	exit; 
}
  
coordTimer = setTimer(coordTimer);
	
if (coordTimer == 0) 
{ 
	x = global.boxOriginX + global.xOffset; 
	y = global.boxOriginY + global.yOffset; 
	coordTimer = -1;
}
	
//APPENA SPAWNA E L'ANIMAZIONE INIZIA
if (global.playerMoveTimer >= 0) 
{ 
	global.playerMoveTimer--; 
	global.beamAnimation = true; 
}
else { global.beamAnimation = false; }
	
//Il valore "-5" è un valore speciale per 
//Non far muovere il player in certe occasioni sperciali;
if (global.playerMoveTimer < 30)
{
	//SOLO SE L'ANIMAZIONE DEL BEAM E' FALSA ALLORA IL PLAYER SARà VISIBILE
	//if (global.beamAnimation == true) { visible = false; } else { visible = true; }
	if (canShow == true) { visible = true; } else { visible = false; }
		
	//STATO ATTUALE CHE DETERMINA IL MOVIMENTO
	if (global.enemyTimer < global.enemyAttackTime - 30) { state(); }
}