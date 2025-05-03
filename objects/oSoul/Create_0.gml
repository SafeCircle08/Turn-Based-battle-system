key_right = keyboard_check(ord("D")) 
key_left = keyboard_check(ord("A")) 
key_up = keyboard_check(ord("W")) 
key_down = keyboard_check(ord("S")) 
key_jump = keyboard_check_pressed(vk_space);

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

//----------------------------VARIABILI STRANE----------------------------
godMode = 0;
canCollide = true;
coordTimer = 1;
canShow = true;
grounded = 0;
jumpSpd = -10;
left = 0;
t = 0;
umbrelling = false;
umbrellaJump = false;
grav = 0.275;

//DIMENSIONI DEL PLAYER IN FORMA
image_xscale = 0.5;
image_yscale = 0.5;
hsp = 0;  
vsp = 0;
canMove = true;
hbX = 0;
hbY = 0;

//Spider State variables
spiderState = 0;
trailLength = 0;

//Shader variables
flashColor = make_color_rgb(50, 250, 100); //Aqua green
flashAlpha = 0;

//L'AURA E' QUELLA BASE (NESSUN EFFETTO APPLICATO)
stateFree = function()
{
	stateInit(sPlayerFront, sNoEffects, "Up");
	hbX = 0;
	hbY = 2.5;
	if (canMove)
	{
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
	var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
	var _possY = clamp(oSoul.y, global.border_u + 8, global.border_d - 11.5);
	oSoul.x = _possX;
	oSoul.y = _possY;
}

//L'AURA E' QUELLA ARANCIONE (TUTTI I COMANDI SONO INVERTITI)
stateMirrored = function()
{
	stateInit(sPlayerFrontMirrored, sInvertedEffect, "Up");
	hbX = 0;
	hbY = 2.5;
	hsp = (key_left - key_right) * global.SoulSpeed;
	vsp = (key_up - key_down) * global.SoulSpeed;
	
	if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
	if (key_down) { sprite_index = sPlayerBehindMirrored; image_speed = 1; }
	if (key_left) { sprite_index = sPlayerRightMirrored; image_speed = 1; }
	if (key_up) { sprite_index = sPlayerFrontMirrored; image_speed = 1; }
	if (key_right) { sprite_index = sPlayerLeftMirrored; image_speed = 1; }
	x += hsp;
	y += vsp;
	
	var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
	var _possY = clamp(oSoul.y, global.border_u + 8, global.border_d - 11.5);
	oSoul.x = _possX;
	oSoul.y = _possY;
}

//QUANDO SPAWNI DIRETTAMENTE CON L'OMBRELLO
stateUmbrella = function()
{
	stateInit(sPlayerUmbrella, sUmbrellaEffect, "Front");
	hbY = -11;
	hbX = -2;
	t += 0.05;
	yFloating = sin(t) * 2;	

	//Setting the horizontal speed
	hsp = (key_right - key_left) * global.SoulSpeed;
	vsp = (key_down - key_up) * global.SoulSpeed;
	
	x += hsp;
	y += vsp + (yFloating / 10);
}

//VIENE CHIAMATA QUANDO C'E' GRAVITA'
usingUmbrella = function()
{
	hbX = -1;
	hbY	= -11;
	if (umbrellaJump == false)
	{
		vsp = -10;
		umbrellaJump = true;
		effect = instance_create_layer(oSoul.x, oSoul.y, "ExtrasObjects", oPlayerEffect);
		effect.sprite_index = sUmbrellaEffect;
	}
	grav = 0.300;
	vsp = clamp(vsp, -7, 1.5);
	sprite_index = sPlayerUmbrella;
}	

//State Jump Base (RIVISITATO)
stateGravity = function()
{
	//Set up generale
	image_angle = 0;
	key_jumpPressed = keyboard_check(vk_space);
	stateInit(sPlayerRightJump, sEffectGravity, "Up");		
	hbX = 0;
	hbY = -10;
	
	//Crea la barra delle collisioni
	//Side box (down)
	if (!instance_exists(oBoxSidePlaftorm_D)) 
	{ 
		instance_destroy(oBoxSidePlatformParent);
		instance_create_layer(x,-500, "ExtrasObjects", oBoxSidePlaftorm_D); 
	}
	
	if (grounded == false)
	{
		if (keyboard_check_pressed(vk_space)) { umbrelling = true; }
		if (umbrelling == true) { usingUmbrella(); }
		
		if (umbrelling == false)
		{
			if (left == true) { sprite_index = sPlayerLeftJumping; image_speed = 1; }
			else { sprite_index = sPlayerRightJumping; image_speed = 1; }
		}
	}	
	
	//Movimenti
	hsp = (key_right - key_left) * global.SoulSpeed;
	if (key_left) { image_speed = 1; left = true; }
	if (key_right) { image_speed = 1; left = false; }
	
	//Gravità
	vsp += grav;
	
	//Quando premo spazio
	if (key_jumpPressed) && (grounded == true) { vsp = jumpSpd; }
	vsp = clamp(vsp, -5, 4);
	
	//Se collido con una base solida
	//quando sto cadendo
	if (vsp > 0)
	{
		var _subPixel = 0.5;
		if (place_meeting( x, y + vsp, oPlatformParent ))
		{
			var _pixelCheck = _subPixel * sign(vsp);
			while !place_meeting( x, y + _pixelCheck, oPlatformParent )
			{
				y += _pixelCheck;	
			}

			//Se collido e avevo l'ombrello:
			if (umbrelling == true)
			{
				instance_create_layer(x, y, "ExtrasObjects", oMiniUmbrella);
				umbrelling = false;
				umbrellaJump = false;
			}
			vsp = 0;
			grounded = true;
		} else 
		{ 
			vsp = max(vsp, jumpSpd / 10);
			grounded = false; 
		}
	}
	else 
	{ 
		if (place_meeting(x, y + vsp, oPlatformParent))
		{
			y -= lerp(0, 5, 0.4) * 2
		}
		grounded = false; 
	}
	
	//Se sono per terra
	if (grounded == true)
	{
		if (left == true) { sprite_index = sPlayerLeftJump; }
		if (left == false) { sprite_index = sPlayerRightJump; }		
		//Se il player è fermo
		if (hsp == 0) && (vsp == 0) { image_speed = 0; image_index = 0; }
	}
	else
	{	
		image_speed = 0.5;
		if (umbrelling == false)
		{
			if (left == true) { sprite_index = sPlayerLeftJumping; }
			if (left == false) { sprite_index = sPlayerRightJumping; }
		}
		else
		{
			sprite_index = sPlayerUmbrella;
		}
	}	
	
	//Aggiorna posizione player
	x += hsp;
	y += vsp;
	var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
	var _possY = clamp(oSoul.y, global.border_u, global.border_d + 1);
	oSoul.x = _possX;
	oSoul.y = _possY;
}

//State Jump y Invertita 
stateGravityUp = function()
{
	//Set up generale
	image_angle = 180;
	key_jumpPressed = keyboard_check(ord("S"));
	stateInit(sPlayerRightJump, sEffectGravity, "Up");		
	hbX = 0;
	hbY = 10;
	
	//Crea la barra delle collisioni
	//Side box (down)
	if (!instance_exists(oBoxSidePlaftorm_U))
	{ 
		instance_destroy(oBoxSidePlatformParent);
		instance_create_layer(x,-500, "ExtrasObjects", oBoxSidePlaftorm_U); 
	}
	
	//Movimenti
	hsp = (key_right - key_left) * global.SoulSpeed;
	if (key_left) { image_speed = 1; left = true; }
	if (key_right) { image_speed = 1; left = false; }
	
	//Gravità
	vsp -= grav;
	
	//Quando premo spazio
	if (key_jumpPressed) && (grounded == true) { vsp = -jumpSpd; }
	vsp = clamp(vsp, -4, 5);

	//Se collido con una base solida
	//quando sto cadendo
	if (vsp < 0)
	{
		var _subPixel = 0.5;
		if (place_meeting( x, y + vsp, oPlatformParent ))
		{
			var _pixelCheck = _subPixel;
			while !place_meeting( x, y - _pixelCheck, oPlatformParent )
			{
				y -= _pixelCheck;	
			}
			vsp = 0;
			grounded = true;
		} 
		else 
		{ 
			grounded = false; 
			vsp = -max(-vsp, jumpSpd / 10);
		}
	}
	else
	{ 
		if (place_meeting(x, y + vsp, oPlatformParent))
		{
			y += lerp(0, 5, 0.4) * 2;
		}
		grounded = false; 
	}
	
	//Se sono per terra
	if (grounded == true)
	{
		if (left == true) { sprite_index = sPlayerRightJump; }
		if (left == false) { sprite_index = sPlayerLeftJump; }		
		//Se il player è fermo
		if (hsp == 0) && (vsp == 0) { image_speed = 0; image_index = 0; }
	}
	else
	{	
		image_speed = 1;
		if (left == true) { sprite_index = sPlayerRightJumping; }
		if (left == false) { sprite_index = sPlayerLeftJumping; }
	}	
	
	//Aggiorna posizione player
	x += hsp;
	y += vsp;		
	var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
	oSoul.x = _possX;
}

//State Jump Right
stateGravityRight = function()
{
	//Set up generale
	image_angle = 90;
	key_jumpPressed = keyboard_check(ord("A"));
	stateInit(sPlayerRightJump, sEffectGravity, "Up");		
	hbX = -10;
	hbY = 0;
	
	//Crea la barra delle collisioni
	//Side box (down)
	if (!instance_exists(oBoxSidePlaftorm_R)) 
	{ 
		instance_destroy(oBoxSidePlatformParent);
		instance_create_layer(x,-500, "ExtrasObjects", oBoxSidePlaftorm_R); 
	}
	
	//Movimenti
	vsp = (key_down - key_up) * global.SoulSpeed;
	if (key_down) { image_speed = 1; left = true; }
	if (key_up) { image_speed = 1; left = false; }
	
	//Gravità
	hsp += grav;
	
	//Quando premo spazio
	if (key_jumpPressed) && (grounded == true) { hsp = jumpSpd; }
	hsp = clamp(hsp, -5, 4);

	//Se collido con una base solida
	//quando sto cadendo
	if (hsp > 0)
	{
		var _subPixel = 0.5;
		if (place_meeting( x + hsp, y, oPlatformParent ))
		{
			var _pixelCheck = _subPixel * sign(hsp);
			while !place_meeting( x + _pixelCheck, y, oPlatformParent )
			{
				x += _pixelCheck;	
			}
			hsp = 0;
			grounded = true;
		} else 
		{ 
			grounded = false; 
			hsp = max(hsp, jumpSpd / 10);
		}
	}
	else 
	{ 
		if (place_meeting(x + hsp, y, oPlatformParent))
		{
			x -= lerp(0, 5, 0.4) * 2;
		}
		grounded = false; 
	}
	
	//Se sono per terra
	if (grounded == true)
	{
		if (left == true) { sprite_index = sPlayerLeftJump; }
		if (left == false) { sprite_index = sPlayerRightJump; }		
		//Se il player è fermo
		if (hsp == 0) && (vsp == 0) { image_speed = 0; image_index = 0; }
	}
	else
	{	
		image_speed = 1;
		if (left == true) { sprite_index = sPlayerLeftJumping; }
		if (left == false) { sprite_index = sPlayerRightJumping; }
	}	
	
	//Aggiorna posizione player
	x += hsp;
	y += vsp;
	var _possY = clamp(oSoul.y, global.border_u + 5, global.border_d - 4);
	oSoul.y = _possY;
}

//State Jump y Invertita 
stateGravityLeft = function()
{
	//Set up generale
	image_angle = 270;
	key_jumpPressed = keyboard_check(ord("D"));
	stateInit(sPlayerRightJump, sEffectGravity, "Up");		
	hbX = 10;
	hbY = 0;
	
	//Crea la barra delle collisioni
	//Side box (down)
	if (!instance_exists(oBoxSidePlaftorm_L))
	{ 
		instance_destroy(oBoxSidePlatformParent);
		instance_create_layer(x,-500, "ExtrasObjects", oBoxSidePlaftorm_L); 
	}
	
	//Movimenti
	vsp = (key_down - key_up) * global.SoulSpeed;
	if (key_down) { image_speed = 1; left = true; }
	if (key_up) { image_speed = 1; left = false; }
	
	//Gravità
	hsp -= grav;
	
	//Quando premo spazio
	if (key_jumpPressed) && (grounded == true) { hsp = -jumpSpd; }
	hsp = clamp(hsp, -4, 5);
	
	//Se collido con una base solida
	//quando sto cadendo
	if (hsp < 0)
	{
		var _subPixel = 0.5;
		if (place_meeting( x + hsp, y, oPlatformParent ))
		{
			var _pixelCheck = _subPixel;
			while !place_meeting( x - _pixelCheck, y, oPlatformParent )
			{
				x -= _pixelCheck;	
			}
			hsp = 0;
			grounded = true;
		} 
		else 
		{ 
			grounded = false; 
			hsp = -max(-hsp, jumpSpd / 10);
		}
	}
	else
	{ 
		if (place_meeting(x + hsp, y, oPlatformParent))
		{
			x += lerp(0, 5, 0.4) * 2;
		}
		grounded = false; 
	}
	
	//Se sono per terra
	if (grounded == true)
	{
		if (left == true) { sprite_index = sPlayerRightJump; }
		if (left == false) { sprite_index = sPlayerLeftJump; }		
		//Se il player è fermo
		if (hsp == 0) && (vsp == 0) { image_speed = 0; image_index = 0; }
	}
	else
	{	
		image_speed = 1;
		if (left == true) { sprite_index = sPlayerRightJumping; }
		if (left == false) { sprite_index = sPlayerLeftJumping; }
	}	
	
	//Aggiorna posizione player
	x += hsp;
	y += vsp;
	var _possY = clamp(oSoul.y, global.border_u + 5, global.border_d - 4);
	oSoul.y = _possY;
}

//Spider State
stateSpider = function()
{
	#region STATE INIT + BASIC MOVEMENT
	stateInit(sPlayerSpiderRight, sSpiderEffect, "SpiderPov");
	if (!instance_exists(oSpiderPointer)) { pointer = instance_create_layer(x, y, "ExtrasObjects", oSpiderPointer); }
	hsp = (key_right - key_left) * global.SoulSpeed;
	if (hsp == 0) { image_speed = 0; image_index = 0; }
	#endregion
	#region SPIDER MOVEMENT (KEYS AND COLLISIONS)
	
	//Quando sono con lo spider a terra
	if (spiderState == 0)
	{
		//La piattaforma di base
		if (!instance_exists(oBoxSidePlaftorm_D)) 
		{ 
			instance_destroy(oBoxSidePlatformParent);
			instance_create_layer(x,-500, "ExtrasObjects", oBoxSidePlaftorm_D); 
		}
		
		//Basic Movement
		if (key_left) { sprite_index = sPlayerSpiderLeft; image_speed = 1; }
		if (key_right) { sprite_index = sPlayerSpiderRight; image_speed = 1; }
		//y = global.border_d + 1;
		pointer.y = global.border_u;
		pointer.image_angle = 0;
		hbX = 0;
		hbY = -10;
		
		//Se sono su una piattaforma ma 
		//"Scivolo" o ci cado:
		if (!place_meeting(x, y + 1, oPlatformParent)) 
		{ 
			image_index = 0;
			image_speed = 0;
			y = global.border_d + 1; 
			//Creo la spider trail
			instance_create_layer(self.x, self.y, "ExtrasObjects", oSpiderTrail, 
			{ image_xscale: 0.5, image_yscale: global.borderHeight / sprite_get_height(sSpiderTrail), image_angle: 0 });
		}
		
		//Se premo per andare in su
		if (key_up)
		{
			//Aggiunge uno fino a quando raggiono il bottomo del box
			while (y > global.border_u)
			{
				//Se collido esco
				if (place_meeting(x, y - 1, oPlatformParent))
				{
					//Creo la spider trail
					instance_create_layer(self.x, self.y, "ExtrasObjects", oSpiderTrail, 
					{ image_xscale: 0.5, image_yscale: global.borderHeight / sprite_get_height(sSpiderTrail), image_angle: 180 });
					break; 
				}
				y--;
			}
			
			//Setto le condizioni giusto della rotazione del player
			image_angle = 180;
			spiderState = 1;
			flashAlpha = 1;
		}
	}
	else
	{
		//La piattaforma di base
		if (!instance_exists(oBoxSidePlaftorm_U))
		{ 
			instance_destroy(oBoxSidePlatformParent);
			instance_create_layer(x,-500, "ExtrasObjects", oBoxSidePlaftorm_U); 
		}
		
		//Basic Movement
		if (key_left) { sprite_index = sPlayerSpiderRight; image_speed = 1; }
		if (key_right) { sprite_index = sPlayerSpiderLeft; image_speed = 1; }
		pointer. y = global.border_d + 1;
		pointer.image_angle = 180;
		hbX = 0;
		hbY = 10;

		//Se sono su una piattaforma ma 
		//"Scivolo" o ci cado:
		if (!place_meeting(x, y - 2, oPlatformParent)) 
		{ 
			image_index = 0;
			image_speed = 0;
			y = global.border_u; 
			//Creo la spider trail
			instance_create_layer(self.x, self.y, "ExtrasObjects", oSpiderTrail, 
			{ image_xscale: 0.5, image_yscale: global.borderHeight / sprite_get_height(sSpiderTrail), image_angle: 180 });
		}
		
		//Se premo per andare in basso:
		if (key_down)
		{
			//Aggiungo sempre di uno
			while (y < global.border_d + 1)
			{
				//Se collido esco
				if (place_meeting(x, y, oPlatformParent))
				{
					//Creo la spider trail
					instance_create_layer(self.x, self.y, "ExtrasObjects", oSpiderTrail, 
					{ image_xscale: 0.5, image_yscale: global.borderHeight / sprite_get_height(sSpiderTrail), image_angle: 0 });
					break; 
				}
				y++;	
			}
			
			//Setto le nuove condizioni di rotazione
			image_angle = 0;
			spiderState = 0;
			flashAlpha = 1;
		}
	}	
	#endregion
	
	if (flashAlpha > 0) { flashAlpha -= 0.05; } 

	x += hsp;
	var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
	oSoul.x = _possX;
}

state = stateFree;