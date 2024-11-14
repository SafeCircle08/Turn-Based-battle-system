key_right = keyboard_check(ord("D")) 
key_left = keyboard_check(ord("A")) 
key_up = keyboard_check(ord("W")) 
key_down = keyboard_check(ord("S")) 
//key_jump_held = keyboard_check_pressed(vk_space);
key_jumpPressed = keyboard_check_pressed(vk_space);

if (oBattleBox.visible == false) { visible = false; exit; }

if (oBattleBox.visible == true)
{
	if (coordTimer > 0) { coordTimer-- }
	if (coordTimer == 0) { x = global.boxOriginX + global.xOffset; y = global.boxOriginY + global.yOffset; coordTimer = -1 }
	
	//APPENA SPAWNA E L'ANIMAZIONE INIZIA
	if (global.playerMoveTimer >= 0) { global.playerMoveTimer--; global.beamAnimation = true; }
	else { global.beamAnimation = false; }
	
	if (global.playerMoveTimer < 30)
	{
		//SOLO SE L'ANIMAZIONE DEL BEAM E' FALSA ALLORA IL PLAYER SARà VISIBILE
		//if (global.beamAnimation == true) { visible = false; } else { visible = true; }
		if (canShow == true) { visible = true; } else { visible = false; }
		
		//STATO ATTUALE CHE DETERMINA IL MOVIMENTO
		if (global.enemyTimer < global.enemyAttackTime - 30) { state(); }
		var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
		var _possY = clamp(oSoul.y, global.border_u + 10, global.border_d - 9);
		oSoul.x = _possX;
		oSoul.y = _possY;
		if (oSoul.x + hsp < global.border_l + 5) || (oSoul.x + hsp > global.border_r - 4) { image_speed = 0; image_index = 0; }
		if (oSoul.y + vsp < global.border_u + 10) || (oSoul.y + vsp > global.border_d - 9) { image_speed = 0; image_index = 0; }
	}
}