function playerStateChange(_newState, _effect, _index,_newPov)
{
	sprite_index = _index;
	oSoul.state = oSoul._newState;
	
	effect = instance_create_layer(oSoul.x, oSoul.y, LAYER_EXTRAS_OBJECTS, oPlayerEffect,
	{ sprite_index : _sprEffect });
	if (instance_exists(oBoxSidePlatformParent)) { instance_destroy(oBoxSidePlatformParent); }
	return;
}