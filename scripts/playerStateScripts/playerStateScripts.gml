function gravCreateRightGravityBorder(_inputgravityBorder)
{
	if (!instance_exists(_inputgravityBorder))
	{ 
		instance_destroy(oBoxSidePlatformParent);
		instance_create_layer(x,-500, LAYER_EXTRAS_OBJECTS, _inputgravityBorder); 
		return;
	}	
}

//If you are under a platform (you make a little jump)
function gravCheckingBaseBorder(_sign, xComponent, yComponent, horizontal = true)
{
	if (place_meeting(x + xComponent, y + yComponent, oPlatformParent))
	{
		if (horizontal) { y += (lerp(0, 5, 0.4) * 2) * _sign; }
		else { x += (lerp(0, 5, 0.4) * 2) * _sign; }
	}
	grounded = false; 
	return;
}

/*
	
	<>_sign: if you are checking down or up (depending on the rotation)
		i.e -> basicGravity -> 1
		i.e -> gravityUp -> -1
	<>xComponent: the amount in wich you are checking the x collisions
	<>yComponent: the amount in wich you are checking the y collisions
		i.e -> basicGravity -> xComponent = 0; yComponent = vsp;
		i.e -> gravityLeft -> xComponent = vsp; yComponent = 0;
		
*/

//Basic collisions with platforms
function gravCheckingBase(_sign, xComponent, yComponent, canUseUmbrella = false, horizontal = true)
{
	var _subPixel = 0.5;
	if (place_meeting( x + xComponent, y + yComponent, oPlatformParent ))
	{
		var _pixelCheck = _subPixel;
		var xCoeff, yCoeff;
		
		//Controls if it checking the xvalue 
		//for the pixelcheck is needed
		if (horizontal) {
			xCoeff = 0;
			yCoeff = 1;
		}
		else {
			xCoeff = 1;
			yCoeff = 0;				
		}
		
		while !place_meeting( x + ((_pixelCheck * sign(_sign))) * xCoeff , y + ((_pixelCheck * sign(_sign))) * yCoeff, oPlatformParent )
		{
			if (horizontal) { y += _pixelCheck * sign(_sign); }
			else { x += _pixelCheck * sign(_sign); }
		}
		
		//Umbrella function
		if (umbrelling == true) && (canUseUmbrella)
		{
			instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oMiniUmbrella);
			umbrelling = false;
			umbrellaJump = false;
		}
		vsp = 0;
		notGroundedDelay = notGroundedDelayRef;
		grounded = true;
		return;
	} 
	else 
	{ 
		vsp = sign(_sign) * max(vsp * sign(_sign), jumpSpd / 10);
		notGroundedDelay = setTimer(notGroundedDelay);
		if (notGroundedDelay == 0)
		{
			grounded = false;
			notGroundedDelay = notGroundedDelayRef;
			return;
		}
	}
}

function gravPlayerIsGrounded(_sprL, _sprR)
{
	jumpTimer = 0;
	if (left == true) { sprite_index = _sprL; }
	if (left == false) { sprite_index = _sprR; }		
	if (hsp == 0) && (vsp == 0) { image_speed = 0; image_index = 0; }
	return;
}

function gravPlayerNotGrounded(_sprL, _sprR, canUseUmbrella = false)
{
	image_speed = 1;
	if (umbrelling == false)
	{
		//jumpTimer++;
		//if (jumpTimer % 3 == 0) { instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oPlayerJumpingFX); }
		if (left == true) { sprite_index = _sprL; }
		if (left == false) { sprite_index = _sprR; }
		return;
	}
	else 
	{
		if (canUseUmbrella)
		{
			sprite_index = sPlayerUmbrella; 
			return;
		}
	}
}

function calculateMovement(key1, key2)
{
	return ((key1 - key2) * global.SoulSpeed);
}

function goodJumpEffect(_sparkNum)
{
	instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oGoodJumpEffect); 
	
	var _grv = 0.1;
	var _xScale = 0.5;
	var _yScale = 0.5;
	for (var i = 0; i < _sparkNum; i++)
	{
		var _vsp = irandom_range(-1, -2);
		var _hsp = irandom_range(-1, 1);
		var _xOffset = irandom_range(-5, 5);
		var _yOffSet = irandom_range(-5, 5);
		var _x = x + _xOffset;
		var _y = y + _yOffSet;
		instance_create_layer(_x, _y, LAYER_EXTRAS_OBJECTS, oSparks, { vspeed:_vsp, hspeed: _hsp, gravity: _grv, image_xscale:_xScale, image_yscale: _yScale });
	}
}

/* gSign: the direction the gravity is acting to */
function gravSetMovements(gSign, sL, sR, canUseUmbrella = false, horizontal = true)
{
	if (canUseUmbrella)
	{
		if (grounded == false)
		{
			if (keyboard_check_pressed(vk_space)) { umbrelling = true; }
			if (umbrelling == true) { usingUmbrella(); }
		
			if (umbrelling == false)
			{
				if (left == true) { sprite_index = sL; image_speed = 1; }
				else { sprite_index = sR; image_speed = 1; }
			}
		}		
	}
	var key1, key2;
	//Movements
	if (horizontal)
	{
		key1 = key_left;
		key2 = key_right;
	}
	else
	{
		key1 = key_down;
		key2 = key_up;			
	}
	
	if (key1) { image_speed = 1; left = true; }
	if (key2) { image_speed = 1; left = false; }
	if (key_jumpPressed) && (grounded == true) 
	{ 
		vsp = jumpSpd * gSign; 
		if ((notGroundedDelay < notGroundedDelayRef) && (notGroundedDelay > 0)) 
		{ 
			goodJumpEffect(4);
		}
	}
	if (gSign == 1) { vsp = clamp(vsp, -5, 4); }
	else { vsp = clamp(vsp, -4, 5); }
	return;
}

//Prova a rendere più compatto
global.playerJumpStateMoveInfo = {
	gravityBasic: {
		angle: 0,
		supportHitBoxX: 0,
		supportHitBoxY: -10,
		jmpKey: vk_space,
		
		gravitySign: 1,
		_sign: 1,
		xComponent: 0, 
		yComponent: noone, //oSoul.vsp
		horizontal: true,
		canUseUmbrella: true,
		rightSprite: sPlayerRightJump,
		leftSprite: sPlayerLeftJump,
		rightJumpingSprite: sPlayerRightJumping_1,
		leftJumpingSprite: sPlayerLeftJumping_1,
		checkCollision: function() {
			return (yComponent > 0)
		},
		boxSidePlatformToCreate: oBoxSidePlaftorm_D,
	},
	gravityUp: {
		angle: 180,
		supportHitBoxX: 0,
		supportHitBoxY: 10,
		jmpKey: ord("S"),
		
		gravitySign: -1,
		_sign: -1,
		xComponent: 0, 
		yComponent: noone,
		horizontal: true, 
		canUseUmbrella: false,
		rightJumpingSprite: sPlayerRightJumping_1,
		leftJumpingSprite: sPlayerRightJumping_1,		
		rightSprite: sPlayerLeftJump,
		leftSprite: sPlayerRightJump,
			checkCollision: function() {
			return (yComponent < 0)
		},
		boxSidePlatformToCreate: oBoxSidePlaftorm_U,
	},
	gravityRight: {
		angle: 90,
		supportHitBoxX: -10,
		supportHitBoxY: 0,
		jmpKey: ord("A"),
		
		gravitySign: 1,
		_sign: 1,
		xComponent: noone,
		yComponent: 0,
		horizontal: false,
		canUseUmbrella: false,
		rightJumpingSprite: sPlayerRightJumping_1,
		leftJumpingSprite: sPlayerLeftJumping_1,
		rightSprite: sPlayerRightJump,
		leftSprite: sPlayerLeftJump,	
		checkCollision: function() {
			return (xComponent > 0)
		},	

		boxSidePlatformToCreate: oBoxSidePlaftorm_R,
	},
	gravityLeft: {
		angle: 270,
		supportHitBoxX: 10,
		supportHitBoxY: 0,
		jmpKey: ord("D"),
		
		gravitySign: -1,
		_sign: -1,
		xComponent: noone,
		yComponent: 0,
		horizontal: false,
		canUseUmbrella: false,
		rightJumpingSprite: sPlayerLeftJumping_1,
		leftJumpingSprite: sPlayerRightJumping_1,
		rightSprite: sPlayerLeftJump,
		leftSprite: sPlayerRightJump,
		checkCollision: function() {
			return (xComponent < 0)
		},
		boxSidePlatformToCreate: oBoxSidePlaftorm_L,
	},
}