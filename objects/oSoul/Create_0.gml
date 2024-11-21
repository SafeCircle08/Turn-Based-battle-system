key_right = keyboard_check(ord("D")) 
key_left = keyboard_check(ord("A")) 
key_up = keyboard_check(ord("W")) 
key_down = keyboard_check(ord("S")) 
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);

//----------------------------VARIABILI GLOBALI---------------------------------------------------
global.SoulSpeed = 2;
global.defenceValue = undefined;
global.attackRandom = undefined; //VALORE AGGIUNTIVO A GLOBAL.BULLETATK (RENDERE I DANNI VARIABILI)
//Variabili per spostare il player 
//(non farlo spawnare sempre al centro delbox)
global.xOffset = 0;
global.yOffset = 0;
global.playerMoveTimer = 65;
global.beamAnimation = false;

//----------------------------VARIABILI STRANE----------------------------
boxColor = c_white;
godMode = 0;
canCollide = true;
coordTimer = 1;
canShow = true;
grounded = 0;
jump = -13;
jump_mod = 3;
grv = 0.2;
vsp_max = 15;


//DIMENSIONI DEL PLAYER IN FORMAA
image_xscale = 0.5;
image_yscale = 0.5;
hsp = 0;  
vsp = 0;

//L'AURA E' QUELLA BASE (NESSUN EFFETTO APPLICATO)
stateFree = function()
{
	hsp = (key_right - key_left) * global.SoulSpeed;
	vsp = (key_down - key_up) * global.SoulSpeed;
	boxColor = c_white;
	
	var _mixX = global.boxOriginX - (global.borderWidth / 2) + 1;
	var _maxX = global.boxOriginX + (global.borderWidth / 2) - 1;
	var _minY = global.boxOriginY - (global.borderHeight / 2) + 1;
	var _maxY = global.boxOriginY + (global.borderHeight / 2) - 1;
	
	startSprite = sPlayerFront;
	
	if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
		
	if (key_down) { sprite_index = sPlayerFront; image_speed = 1; }
	if (key_left) { sprite_index = sPlayerLeft; image_speed = 1; }
	if (key_up) { sprite_index = sPlayerBehind; image_speed = 1; }
	if (key_right) { sprite_index = sPlayerRight; image_speed = 1; }
	x += hsp;
	y += vsp;
}

//L'AURA E' QUELLA ARANCIONE (TUTTI I COMANDI SONO INVERTITI)
stateMirrored = function()
{
	hsp = (key_left - key_right) * global.SoulSpeed;
	vsp = (key_up - key_down) * global.SoulSpeed;
	boxColor = make_color_rgb(240, 80, 0) //arancione scuro
	
	startSprite = sPlayerFrontMirrored;
	
	if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
	if (key_down) { sprite_index = sPlayerBehindMirrored; image_speed = 1; }
	if (key_left) { sprite_index = sPlayerRightMirrored; image_speed = 1; }
	if (key_up) { sprite_index = sPlayerFrontMirrored; image_speed = 1; }
	if (key_right) { sprite_index = sPlayerLeftMirrored; image_speed = 1; }

	x += hsp;
	y += vsp;
}

//L'AURA E' QUELLA BLU (GRAVITA, DIVENTA COME UN PLATFORMER)
stateGravity = function()
{
	
	image_angle = 0
	
	//startSprite = sPlayerJumpFront;
	hsp = (key_right - key_left) * global.SoulSpeed;
	if (key_left) { sprite_index = sPlayerLeftJump; image_speed = 1; }
	if (key_right) { sprite_index = sPlayerRightJump; image_speed = 1; }
	boxColor = c_white;

	if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
	//SE PREMI SPAZIO
	if ((key_jumpPressed == 1) && (vsp == 0)) { vsp += jump; }
	
	if (vsp < 0) { vsp = max(vsp, jump / jump_mod) }
	vsp = clamp(vsp, -vsp_max, vsp_max);
	
	//SE COLLIDI A DESTRA O SINISTRA CON I MURI
	if (vsp < 0) { if (place_meeting(x + hsp, y, oPlatformParent)) { hsp = 0; } }
	
	//SE SEI SOPRA AD UNA PIATTAFORMA
	if (place_meeting(x, y + vsp, oPlatformParent))
	{
		if (vsp < 0) { grounded = 0; y -= 2; }
		else { grounded = 1; vsp = 0; }
	}
	
	//SE STO TOCCANDO IL SOFFITTO DEL BOX
	if (y < global.boxOriginY - (global.borderHeight / 2) + sprite_get_height(sprite_index) - 31) { vsp -= jump + 12 }
	
	if (y + vsp >= global.boxOriginY + global.borderHeight / 2 - 10)
	{
		grounded = 1;	
		grv = 0;
		vsp = 0;
	} else { grv = 0.2; }
	
	vsp += grv;
	
	//SE COLLIDO CON IL "LIQUIDO" IN FONDO
	if (place_meeting(x, y, oWaveTrigger)) { vsp += jump * 2; }
	
	x += hsp;
	y += vsp;
}
//L'AURA E' SEMPRE QUELLA BLU, MA LA GRAVITA' E' INVERTITA
stateGravityUp = function()
{
	image_angle = 180;
	
	//startSprite = sPlayerJumpFront;
	hsp = (key_right - key_left) * global.SoulSpeed;
	if (key_left) { sprite_index = sPlayerRightJump; image_speed = 1; }
	if (key_right) { sprite_index = sPlayerLeftJump; image_speed = 1; }
	boxColor = c_white;

	if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
	if (vsp < 0) { vsp = max(vsp, jump / jump_mod) }
	vsp = clamp(vsp, -vsp_max, vsp_max);
	
	
	//SE COLLIDI A DESTRA O SINISTRA CON I MURI
	if (vsp < 0) { if (place_meeting(x + hsp, y, oPlatformParent)) { hsp = 0; } }
	
	//SE SEI SOPRA AD UNA PIATTAFORMA
	if (place_meeting(x, y + vsp, oPlatformParent))
	{
		if (vsp < 0) { grounded = 0; y -= 2; }
		else { grounded = 1; vsp = 0; }
	}
	
	//SE STO TOCCANDO IL SOFFITTO DEL BOX
	//if (y < global.boxOriginY - (global.borderHeight / 2) + sprite_get_height(sprite_index) - 31) { vsp -= jump + 12 }
	
	if (y <= global.boxOriginY - (global.borderHeight / 2) + 10)
	{
		grounded = 1;	
		grv = 0;
		vsp = 0;
		if (key_jumpPressed == 1) { vsp -= jump + 9; }
	} else { grv = 0.2; }
	
	vsp -= grv;

	x += hsp;
	y += vsp;
}

state = stateFree;