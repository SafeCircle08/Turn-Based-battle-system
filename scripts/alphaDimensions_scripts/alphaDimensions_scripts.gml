function reduceDimAlpha(_obj, _ref = oDrumPadObjectsParent, _amount = 0.02)
{
	_obj.image_xscale -= _amount;
	_obj.image_yscale -=_amount;
	_obj.image_alpha -= _amount;
	if (_obj.image_alpha <= -1) { instance_destroy(_ref); }
	return;
}

function reduceAlpha(_obj, _amount = 0.005, _destroyWhen0 = true)
{
	_obj.image_alpha -= _amount;
	if (_destroyWhen0)
	{
		if (image_alpha <= 0) { instance_destroy(_obj); }	
	}
	return;
}