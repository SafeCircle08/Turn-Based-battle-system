function scr_shake(_timer, _canShake)
{
	var _shakeSrc = instance_create_layer(x, y, LAYER_BULLETS, oShake);
	_shakeSrc.shake = _canShake;
	_shakeSrc.shakeTimer = _timer;
}