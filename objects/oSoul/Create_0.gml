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
//(non farlo spawnare sempre al centro del box)
global.xOffset = 0;
global.yOffset = 0;
global.playerMoveTimer = 65;
global.beamAnimation = false;

xAngle = 0;
yAngle = 0;
xAngleIncr = 0;
yAngleincr = 0;

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
vsp_max = 4;
hsp_max = 4;
left = 0;
t = 0;
umbrelling = false;
umbrellaJump = false;

//DIMENSIONI DEL PLAYER IN FORMA
image_xscale = 0.5;
image_yscale = 0.5;
hsp = 0;  
vsp = 0;

//L'AURA E' QUELLA BASE (NESSUN EFFETTO APPLICATO)
stateFree = function()
{
	stateInit(sPlayerFront, stateFree, sNoEffects);
	
	hsp = (key_right - key_left) * global.SoulSpeed;
	vsp = (key_down - key_up) * global.SoulSpeed;
	
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
	stateInit(sPlayerFrontMirrored, stateMirrored, sInvertedEffect);
	
	hsp = (key_left - key_right) * global.SoulSpeed;
	vsp = (key_up - key_down) * global.SoulSpeed;
	
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
	image_angle = 0;
	key_jumpPressed = keyboard_check(vk_space);
	stateInit(sPlayerRightJump, stateGravity, sEffectGravity);
	
	//Setting the horizontal speed
	hsp = (key_right - key_left) * global.SoulSpeed;
	if (key_left) { image_speed = 1; left = true; }
	if (key_right) { image_speed = 1; left = false; }
	
	if (grounded != 1)
	{
		if (keyboard_check_pressed(vk_space)) { umbrelling = true; }
		if (umbrelling == true) { usingUmbrella(); }
		
		if (umbrelling == false)
		{
			if (left == true) { sprite_index = sPlayerLeftJumping; image_speed = 1; }
			else { sprite_index = sPlayerRightJumping; image_speed = 1; }
			if (place_meeting(x + hsp, y, oPlatformParent)) { hsp = 0; } 
		}
	}
	
	//If the player is standing still
	if (hsp == 0) && (vsp == 0) { image_speed = 0; image_index = 0; }
	
	//SE PREMI SPAZIO-------------------------------------------------------------------
	if ((key_jumpPressed == 1) && (vsp == 0) && (grounded == 1)) { vsp += jump; grounded = 0; }
	if (vsp < 0) { vsp = max(vsp, jump / jump_mod); }
	vsp = clamp(vsp, -4, 4);
	
	if (y - sprite_get_width(sprite_index) / 2 <= global.border_u) { vsp += 1 }
	
	//SE SEI SUL BORDO-------------------------------------------------------------------
	if (y + sprite_get_height(sprite_index) / 4 >= global.border_d)
	{
		if (left == true) { sprite_index = sPlayerLeftJump; } else sprite_index = sPlayerRightJump;
		grounded = 1;	
		grv = 0;
		vsp = 0;
		if (umbrelling == true)
		{
			umbrelling = false;
			umbrellaJump = false;
			instance_create_layer(x, y, "ExtrasObjects", oMiniUmbrella);
		}
		if ((key_jumpPressed == 1) && (vsp == 0)) { vsp += jump; grounded = 0; }
	} 
	else 
	{
		if (umbrelling == false) { grv = 0.2; }
		else { grv = 0.05; }
		grounded = 0; 	
	} 
	
	//SE STAI COLLIDENDO CON UNA PIATTAFORMA----------------------------
	if (place_meeting(x, y + vsp, oPlatformParent))
	{
		if (vsp < 0) { grounded = 0; y -= 2; }
		else 
		{ 
			if (umbrelling == true)
			{
				instance_create_layer(x, y, "ExtrasObjects", oMiniUmbrella);
				umbrelling = false;
				umbrellaJump = false;
			}
			grounded = 1; 
			vsp = 0; 
			grv = 0; 
			if (left == true) { sprite_index = sPlayerLeftJump; } else { sprite_index = sPlayerRightJump; }
		}
	} 

	vsp += grv;
	
	//SE COLLIDO CON IL "LIQUIDO" IN FONDO
	if (place_meeting(x, y, oWaveTrigger)) { vsp += jump*3; grounded = 0; umbrelling = false; }
	
	x += hsp;
	y += vsp;
}

//L'AURA E' SEMPRE QUELLA BLU, MA LA GRAVITA' E' INVERTITA
stateGravityUp = function()
{
	key_jumpPressed = keyboard_check(ord("S"));
	image_angle = 180;
	stateInit(sPlayerRightJump, stateGravityUp, sEffectGravity);
	
	//Setting the horizontal speed
	hsp = (key_right - key_left) * global.SoulSpeed;
	if (key_left) { image_speed = 1; left = true; }
	if (key_right) { image_speed = 1; left = false; }
	
	if (grounded != 1) 
	{ 
		if (left == true) { sprite_index = sPlayerRightJumping; image_speed = 1; }
		else
		{ sprite_index = sPlayerLeftJumping; image_speed = 1; }
	}
	
	if ((key_jumpPressed == 1) && (vsp == 0) && (grounded == 1)) { vsp -= jump + 9; grounded = 0; }
	
	//If the player is standing still
	if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
	//DARE UN'OCCHIATA ANCHE QUI
	if (vsp < 0) { vsp = max(vsp, jump / jump_mod) }
	
	//------------------------------------
	vsp = clamp(vsp, -vsp_max*2, 7);
	//------------------------------------
	
	//SE COLLIDI A DESTRA O SINISTRA CON I MURI
	if (vsp > 0) { if (place_meeting(x + hsp, y, oPlatformParent)) { hsp = 0; } }
	
	//SE STO TOCCANDO IL SOFFITTO DEL BOX
	if (y > global.boxOriginY + (global.borderHeight / 2) + sprite_get_height(sprite_index) / 4) { vsp -= jump + 12 }

	//SE SEI LUNGO IL BORDO
	if (y + vsp <= (global.boxOriginY - (global.borderHeight / 2)) + 11)
	{
		if (left == true) { sprite_index = sPlayerRightJump; } else sprite_index = sPlayerLeftJump;
		grounded = 1;	
		grv = 0;
		vsp = 0;
		if (key_jumpPressed == 1) { vsp -= jump + 9; grounded = 0; }
	} else { grv = 0.2; }
	
	//SE SEI SOPRA AD UNA PIATTAFORMA
	if (place_meeting(x, y + vsp, oPlatformParent))
	{
		if (vsp > 0) { grounded = 0; y += 2; }
		else 
		{
			grounded = 1; 
			vsp = 0;
			grv = 0;
			if (left = true) { sprite_index = sPlayerLeftJump; } 
			else sprite_index = sPlayerRightJump;
		}
	}

	vsp -= grv;

	x += hsp;
	y += vsp;
}

//L'AURA E' SEMPRE QUELLA BLU, MA LA GRAVITA' E' E' ATTRATTA DAL BORDO DI SINISTRA
stateGravityLeft = function() 
{
	key_jumpPressed = keyboard_check(ord("D"));
	image_angle = 270;
	
	stateInit(sPlayerRightJump, stateGravityLeft, sEffectGravity);
	
	//Setting the vertical speed
	vsp = (key_down - key_up) * global.SoulSpeed;
	if (key_up) { image_speed = 1; left = true; }
	if (key_down) { image_speed = 1; left = false; }
	if (grounded != 1) 
	{ 
		if (left = true) { sprite_index = sPlayerLeftJumping; image_speed = 1; }
		else
		{ sprite_index = sPlayerRightJumping; image_speed = 1; }
	}
	
	//If the player is standing still
	if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
	//DARE UN'OCCHIATA ANCHE QUI
	if (hsp < 0) { hsp = max(hsp, jump / jump_mod) }
	
	//------------------------------------
	hsp = clamp(hsp, -hsp_max*2, 7);
	//------------------------------------
	
	//SE COLLIDI SOPRA O SOTTO CON I MURI
	if (hsp < 0) { if (place_meeting(x + hsp, y, oPlatformParent)) { hsp = 0; } }
	
	//SE SEI SOPRA AD UNA PIATTAFORMA
	if (place_meeting(x + hsp, y, oPlatformParent))
	{
		if (hsp < 0) { grounded = 0; x -= 2; }
		else 
		{
			grounded = 1; hsp = 0; 
			if (left = true) { sprite_index = sPlayerLeftJump; }
			else sprite_index = sPlayerRightJump;
		}
	}
	
	//SE STO TOCCANDO IL SOFFITTO DEL BOX
	if (x > global.boxOriginX + (global.borderWidth / 2) + sprite_get_height(sprite_index) - 31) 
	{ 
		hsp -= jump + 12 
	}
	
	//If the player is on the left part of the box
	if (x + hsp <= global.boxOriginX - global.borderWidth / 2 + 11)
	{
		if (left = true) { sprite_index = sPlayerLeftJump; } else sprite_index = sPlayerRightJump;
		grounded = 1;	
		grv = 0;
		hsp = 0;
		//If you press space
		if ((key_jumpPressed == 1) && (hsp == 0) && (grounded == 1)) { hsp -= jump + 9; grounded = 0; }
	} else { grv = 0.2; }
	
	hsp -= grv;
	
	//SE COLLIDO CON IL "LIQUIDO" IN FONDO
	if (place_meeting(x, y, oWaveTrigger)) { vsp += jump * 2; }
	
	x += hsp;
	y += vsp;
}

//L'AURA E' SEMPRE QUELLA BLU, MA LA GRAVITA' E' E' ATTRATTA DAL BORDO DI DESTRA
stateGravityRight = function() 
{
	key_jumpPressed = keyboard_check(ord("A"));
	image_angle = 90;
	
	stateInit(sPlayerRightJump, stateGravityRight, sEffectGravity);
	
	//Setting the vertical speed
	vsp = (key_down - key_up) * global.SoulSpeed;
	if (key_up) { image_speed = 1; left = true; }
	if (key_down) { image_speed = 1; left = false; }
	if (grounded != 1)
	{ 
		if (left = true) { sprite_index = sPlayerRightJumping; image_speed = 1; }
		else
		{ sprite_index = sPlayerLeftJumping; image_speed = 1; }
	}
	
	//If the player is standing still
	if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
	//DARE UN'OCCHIATA ANCHE QUI
	if (hsp < 0) { hsp = max(hsp, jump / jump_mod) }

	//------------------------------------
	hsp = clamp(hsp, -hsp_max*2, 3);
	//------------------------------------
	
	//SE COLLIDI SOPRA O SOTTO CON I MURI
	if (hsp < 0) { if (place_meeting(x + hsp, y, oPlatformParent)) { hsp = 0; } }
	
	//SE SEI SOPRA AD UNA PIATTAFORMA
	if (place_meeting(x + hsp, y, oPlatformParent))
	{
		if (hsp < 0) { grounded = 0; x -= 2; }
		else 
		{ 
			grounded = 1; hsp = 0;
			if (left = true) { sprite_index = sPlayerRightJump; }
			else sprite_index = sPlayerLeftJump;
		}
	}
	
	//SE STO TOCCANDO IL SOFFITTO DEL BOX
	if (x < global.boxOriginX - (global.borderWidth / 2) + sprite_get_height(sprite_index)) { }
	
	//If the player is on the left part of the box
	if (x + hsp >= global.boxOriginX + global.borderWidth / 2 - 10)
	{
		if (left = true) { sprite_index = sPlayerRightJump; } else sprite_index = sPlayerLeftJump;
		grounded = 1;	
		grv = 0;
		hsp = 0;
		//If you press space
		if ((key_jumpPressed == 1) && (hsp == 0) && (grounded == 1)) { hsp += jump + 9; grounded = 0; }
	} else { grv = 0.2; }
	
	hsp += grv;
	
	//SE COLLIDO CON IL "LIQUIDO" IN FONDO
	if (place_meeting(x, y, oWaveTrigger)) { vsp -= jump * 2; }
	
	x += hsp;
	y += vsp;
}

//QUANDO SPAWNI DIRETTAMENTE CON L'OMBRELLO
stateUmbrella = function()
{
	t += 0.05;
	yFloating = sin(t) * 2;	
	stateInit(sPlayerUmbrella, stateUmbrella, sUmbrellaEffect);

	//Setting the horizontal speed
	hsp = (key_right - key_left) * global.SoulSpeed;
	vsp = (key_down - key_up) * global.SoulSpeed;
	
	x += hsp;
	y += vsp + (yFloating / 10);
}

//VIENE CHIAMATA QUANDO C'E' GRAVITA'
usingUmbrella = function()
{
	if (umbrellaJump == false)
	{
		vsp -= 4;
		umbrellaJump = true;
		effect = instance_create_layer(oSoul.x, oSoul.y, "ExtrasObjects", oPlayerEffect);
		effect.sprite_index = sUmbrellaEffect;
	}
	sprite_index = sPlayerUmbrella;
}	

state = stateFree;