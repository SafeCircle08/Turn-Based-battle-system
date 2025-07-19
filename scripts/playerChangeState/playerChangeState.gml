function playerChangeState(_newState, _spr, _effectSpr = sNoEffects, _xOffSet = 0, _yOffSet = 0,_newPov = "Up")
{
	oSoul.sprite_index = _spr;
	oSoul.x += _xOffSet;
	oSoul.y += _yOffSet;
	oSoul.state = _newState;
	global.pov = _newPov;
	if (global.beamAnimation == false)
	{
		instance_create_layer(oSoul.x, oSoul.y, LAYER_EXTRAS_OBJECTS, oPlayerEffect, 
		{ sprite_index: _effectSpr });
		return;
	}
	return;
}