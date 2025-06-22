function gravCreateRightGravityBorder(_inputgravityBorder)
{
	if (!instance_exists(_inputgravityBorder))
	{ 
		instance_destroy(oBoxSidePlatformParent);
		instance_create_layer(x,-500, "ExtrasObjects", _inputgravityBorder); 
	}	
}

function gravCheckingBaseBorder(_sign, xComponent, yComponent, horizontal = true)
{
	if (place_meeting(x + xComponent, y + yComponent, oPlatformParent))
	{
		if (horizontal) { y += (lerp(0, 5, 0.4) * 2) * _sign; }
		else { x += (lerp(0, 5, 0.4) * 2) * _sign; }
	}
	grounded = false; 	
}

function gravCheckingBase(_sign, xComponent, yComponent,canUseUmbrella = false, horizontal = true)
{
	var _subPixel = 0.5;
	if (place_meeting( x + xComponent, y + yComponent, oPlatformParent ))
	{
		var _pixelCheck = _subPixel;
		var xCoeff, yCoeff;
		//Controls if it checking the xvalue 
		//for the pixelcheck is needed
		if (horizontal)
		{
			xCoeff = 0;
			yCoeff = 1;
		}
		else 
		{
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
			instance_create_layer(x, y, "ExtrasObjects", oMiniUmbrella);
			umbrelling = false;
			umbrellaJump = false;
		}
		vsp = 0;
		grounded = true;
	} 
	else 
	{ 
		vsp = sign(_sign) * max(vsp * sign(_sign), jumpSpd / 10);
		grounded = false; 
	}	
}

function gravPlayerIsGrounded(_sprL, _sprR)
{
	jumpTimer = 0;
	if (left == true) { sprite_index = _sprL; }
	if (left == false) { sprite_index = _sprR; }		
	if (hsp == 0) && (vsp == 0) { image_speed = 0; image_index = 0; }	
}

function gravPlayerNotGrounded(_sprL, _sprR, canUseUmbrella = false)
{
	image_speed = 1;
	if (umbrelling == false)
	{
		jumpTimer++;
		if (jumpTimer % 3 == 0) { instance_create_layer(x, y, "ExtrasObjects", oPlayerJumpingFX);	 }
		if (left == true) { sprite_index = _sprL; }
		if (left == false) { sprite_index = _sprR; }
	}
	else 
	{
		if (canUseUmbrella)
		{
			sprite_index = sPlayerUmbrella; 
		}
	}
}

function calculateMovement(key1, key2)
{
	return ((key1 - key2) * global.SoulSpeed);
}

function gravSetMovements(xSign, ySign, gSign, sL, sR, canUseUmbrella = false, horizontal = true)
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
	if (key_jumpPressed) && (grounded == true) { vsp = jumpSpd * gSign; }
	if (gSign == 1) { vsp = clamp(vsp, -5, 4); }
	else { vsp = clamp(vsp, -4, 5); }
}
