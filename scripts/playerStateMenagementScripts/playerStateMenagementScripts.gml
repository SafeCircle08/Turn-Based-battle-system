//Used to initialize the new state
//Start of the turn
function playerSetState(_newState)
{
	oSoul.state = _newState;
	return;
}

//To actually change the state during the turn
function playerStateChange(_newState, _effect, _index,_newPov)
{
	oSoul.sprite_index = _index;
	oSoul.state = oSoul._newState;
	
	effect = instance_create_layer(oSoul.x, oSoul.y, LAYER_EXTRAS_OBJECTS, oPlayerEffect,
	{ sprite_index : _sprEffect });
	if (instance_exists(oBoxSidePlatformParent)) { instance_destroy(oBoxSidePlatformParent); }
	return;
}

function setPlayerSpritePov(_spr, _newPov)
{
	sprite_index = _spr;
	global.pov = _newPov;
}

function setPlayerStateEffect(_effect, _otherInits = function() {})
{
	effect = instance_create_layer(oSoul.x, oSoul.y, LAYER_EXTRAS_OBJECTS, oPlayerEffect);
	effect.sprite_index = _effect;
	if (instance_exists(oBoxSidePlatformParent)) { instance_destroy(oBoxSidePlatformParent); }
	_otherInits();
	return;		
}

//Only called during the beam animation
function stateInit(_sIndex, _sprEffect, _pov, _method = function() {})
{
	var _beamValue = BEAM_ANIMATION_TIMER_REF / 2 - 1;
	if (global.beamAnimationTimer == _beamValue) { setPlayerSpritePov(_sIndex, _pov); }
	if (global.beamAnimationTimer == 1) { setPlayerStateEffect(_sprEffect, _method()); }
}