function makeAlphaListEffect(_fxSpr, startAlpha, _amount, _xspd, _yspd, _x, _y, _layer)
{
	var _myAlphaListFX = instance_create_layer(_x, _y, _layer, oAlphaListFX);
	_myAlphaListFX.sprite_index = _fxSpr;
	_myAlphaListFX.image_alpha = startAlpha;
	_myAlphaListFX.amount = _amount;
	_myAlphaListFX.xspd = _xspd;
	_myAlphaListFX.yspd = _yspd;
}