function playerChangeState(_globalStateInfo, _additionlVarsMethod = function() {})
{
	with (oSoul)
	{
		sprite_index = _globalStateInfo.startSprite;
		image_angle = _globalStateInfo.angle;
		x += _globalStateInfo.xOffSet;
		y += _globalStateInfo.yOffSet;
		state = _globalStateInfo.state;
		hbX = _globalStateInfo.hbX;
		hbY = _globalStateInfo.hbY;
		global.pov = _globalStateInfo.pov;
		_additionlVarsMethod();
		if (global.beamAnimation == false)
		{
			instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oPlayerEffect, 
			{ sprite_index: _globalStateInfo.effectSpr });
			return;
		}	
	}
}

function additionalGravityStateMethod(_newGravityState) {
	var _changeJumpPower = 5;
	with (oSoul)
	{
		if (inUseGravity.horizontal) { vsp += _changeJumpPower * -inUseGravity._sign; }
		else { vsp += _changeJumpPower * -inUseGravity._sign; }
		vsp = clamp(vsp, -2, 2);
		image_angle = inUseGravity.angle;
		gravCreateRightGravityBorder(inUseGravity.boxSidePlatformToCreate);
	}		
}