function playerChangeState(_newState, _effectSprite)
{
	oSoul.state = _newState;
	effect = instance_create_layer(oSoul.x, oSoul.y, "ExtrasObjects", oPlayerEffect);
	effect.sprite_index = _effectSprite;
}