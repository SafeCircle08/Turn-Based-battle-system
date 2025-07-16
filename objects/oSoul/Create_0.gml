key_right = keyboard_check(ord("D")) 
key_left = keyboard_check(ord("A")) 
key_up = keyboard_check(ord("W")) 
key_down = keyboard_check(ord("S")) 
key_jump = keyboard_check_pressed(vk_space);
key_jumpPressed = keyboard_check(vk_space);

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
jumpTimer = 0;
notGroundedDelayRef = 10;
notGroundedDelay = notGroundedDelayRef;

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
flickTimer = 50;

//Shader variables
flashColor = make_color_rgb(255, 255, 255); //Aqua green
flashAlpha = 0;
timer = 0;
duration = 30;
yellowPopping = false;

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

#region GRAVITY FUNCTIONS

//VIENE CHIAMATA QUANDO C'E' GRAVITA'
usingUmbrella = function()
{
	hbX = -1;
	hbY	= -11;
	if (umbrellaJump == false)
	{
		vsp = -10;
		umbrellaJump = true;
		effect = instance_create_layer(oSoul.x, oSoul.y, LAYER_EXTRAS_OBJECTS, oPlayerEffect);
		effect.sprite_index = sUmbrellaEffect;
	}
	grav = 0.300;
	vsp = clamp(vsp, -7, 1.5);
	sprite_index = sPlayerUmbrella;
}	

inUseGravity = global.playerJumpStateMoveInfo.gravityBasic;

//State Jump Base (RIVISITATO)
stateGravity = function()
{
	//TODO---FARE IN MODO CHE OGNI VOLTA CHE SI CAMBI LO STATE
	//LE VARIABILI SI INIZIALIZZINO DI NUOVO (SE CAMBI QUELLE DI JUMP,
	//NON VENGONO CAMBIATI SPRITE, NON VENGONO CREATI BORDER ECC...
	//PERCHE' SONO INIZIALIZZATI ED ESEGUITI SOLO APPENA IL PLAYER SPAWNA NEL BOX.
	//POTREBBE ESSERE NECESSARIO MODIFICARE LA FUNZIONE stateInit
	
	//Itialize all the player new state info
	var _jmpKey = inUseGravity.jmpKey;
	key_jumpPressed = keyboard_check(_jmpKey);
	
	stateInit(
		sPlayerRightJump, 
		sEffectGravity, 
		"Front", 
		method(self, function() {
			image_angle = inUseGravity.angle
			hbX = inUseGravity.supportHitBoxX;
			hbY = inUseGravity.supportHitBoxY;
			var _rightBorder = inUseGravity.boxSidePlatformToCreate;
			gravCreateRightGravityBorder(_rightBorder);
		}));
	
	gravSetMovements(
		inUseGravity.gravitySign, 
		inUseGravity.leftJumpingSprite, 
		inUseGravity.rightJumpingSprite, 
		inUseGravity.canUseUmbrella,
		inUseGravity.horizontal
	);
	
	vsp += grav * inUseGravity._sign;
	
	if (inUseGravity.horizontal) {
		inUseGravity.yComponent = vsp;
		inUseGravity.xComponent = 0;
		hsp = calculateMovement(key_right, key_left, 1);
	}
	else {
		inUseGravity.yComponent = 0;
		inUseGravity.xComponent = vsp;
		hsp = calculateMovement(key_down, key_up, 1);
	}
	
	//Instances collisions
	if (inUseGravity.checkCollision()) { 
		gravCheckingBase(
			inUseGravity._sign,
			inUseGravity.xComponent,
			inUseGravity.yComponent,
			inUseGravity.canUseUmbrella,
			inUseGravity.horizontal
		); 
	}
	else { 
		gravCheckingBaseBorder(
			inUseGravity._sign * -1,
			inUseGravity.xComponent,
			inUseGravity.yComponent,
			inUseGravity.horizontal
		); 
	}
	
	//Checking the player grounded variable
	if (grounded == true)  {
		gravPlayerIsGrounded(
			inUseGravity.leftSprite, 
			inUseGravity.rightSprite
		); 
	}
	else {
		gravPlayerNotGrounded(
			inUseGravity.rightJumpingSprite, 
			inUseGravity.leftJumpingSprite, 
			inUseGravity.canUseUmbrella
		); 
	}
	
	//Updates the player coords
	
	if (inUseGravity.horizontal) {
		x += hsp;
		y += vsp;
		var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
		oSoul.x = _possX;
	}
	else {
		x += vsp;
		y += hsp;
		var _possY = clamp(oSoul.y, -100, global.border_d + 2);
		oSoul.y = _possY;
	}
}

#endregion

//Spider State
stateSpider = function()
{
	#region STATE INIT + BASIC MOVEMENT
	stateInit(sPlayerSpiderRight, sSpiderEffect, "SpiderPov");
	if (!instance_exists(oSpiderPointer)) { pointer = instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oSpiderPointer); }
	hsp = (key_right - key_left) * global.SoulSpeed;
	if (hsp == 0) { image_speed = 0; image_index = 0; }
	#endregion
	#region SPIDER MOVEMENT (KEYS AND COLLISIONS)
	//Quando sono con lo spider a terra
	if (spiderState == 0)
	{
		//La piattaforma di base
		gravCreateRightGravityBorder(oBoxSidePlaftorm_D);
		
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
			y = global.border_d + 1; 
			createSpiderTrail(0);
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
					createSpiderTrail(180);
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
		gravCreateRightGravityBorder(oBoxSidePlaftorm_U);
		
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
			y = global.border_u; 
			createSpiderTrail(180);
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
					createSpiderTrail(0);
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
	
	if (flashAlpha > 0) 
	{ 
		flashAlpha -= 0.05; 
	}
	
	x += hsp;
	var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
	oSoul.x = _possX;
}

stateSliding = function()
{
	var _createSparks = function() 
	{ 
		if (!instance_exists(oSlidingSparks))
		{
			instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oSlidingSparks);
		}
	}
	stateInit(sPlayerSliding, sPlayerPickaxe, "Front", true, _createSparks());
	sprite_index = oRailsAttack.spriteInput;
	if (instance_exists(oRailsAttack)) 
	{ 		
		var _maxX = oRailsAttack.maxPlayerX; 
		hsp = (key_right - key_left) * global.SoulSpeed;
		x = clamp(x, global.border_l + 12, _maxX - 10);
	}
}
state = stateFree;