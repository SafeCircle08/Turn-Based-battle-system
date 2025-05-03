function playerChangeState(_newState, _effectSpr = sNoEffects, _newPov = "Up")
{
	oSoul.state = _newState;
	global.pov = _newPov;
	if (global.beamAnimation == false)
	{
		instance_create_layer(oSoul.x, oSoul.y, "ExtrasObjects", oPlayerEffect, 
		{ sprite_index: _effectSpr });
		return;
	}
	return;
}