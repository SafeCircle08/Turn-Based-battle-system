function stateGravityLoad()
{
	grounded = 0;
	jumpSpd = -10;
	umbrelling = false;
	umbrellaJump = false;
	grav = 0.275;
	jumpTimer = 0;
	notGroundedDelayRef = 10;
	notGroundedDelay = notGroundedDelayRef;
	inUseGravity = global.playerJumpStateMoveInfo.gravityBasic;
	
	stateGravity = function()
	{
		var _jmpKey = inUseGravity.jmpKey;
		key_jumpPressed = keyboard_check(_jmpKey);
	
		stateInit(
			global.playerJumpStateMoveInfo.spaceSprite, 
			sEffectGravity, 
			"Front", 
			method(self, function() {
				image_angle = inUseGravity.angle
				var _rightBorder = inUseGravity.boxSidePlatformToCreate;
				gravCreateRightGravityBorder(_rightBorder);
			}));
	
		gravSetMovements(
			inUseGravity.gravitySign, 
			inUseGravity.canUseUmbrella,
			inUseGravity.horizontal
		);
	
		vsp += grav * inUseGravity._sign;
	
		if (inUseGravity.horizontal) {
			inUseGravity.yComponent = vsp;
			inUseGravity.xComponent = 0;
			hsp = calculateMovement(key_right, key_left);
		}
		else {
			inUseGravity.yComponent = 0;
			inUseGravity.xComponent = vsp;
			hsp = calculateMovement(key_down, key_up);
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
		
		if (grounded == true) { gravPlayerIsGrounded(); }
		else { gravPlayerNotGrounded(inUseGravity.canUseUmbrella); }
	
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
}