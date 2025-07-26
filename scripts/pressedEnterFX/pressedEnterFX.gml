function pressedEnterFX(_x, _y, _sprite)
{
	var _btnFX = instance_create_layer(_x, _y, LAYER_EFFECT, oIncreaseAlphaDimFX);
	_btnFX.sprite_index = _sprite;
}