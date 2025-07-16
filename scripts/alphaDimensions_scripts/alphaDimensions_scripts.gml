function reduceDimAlpha(_obj, _ref = oDrumPadObjectsParent, _amount = 0.02)
{
	_obj.image_xscale -= _amount;
	_obj.image_yscale -=_amount;
	_obj.image_alpha -= _amount;
	if (_obj.image_alpha <= -1) { instance_destroy(_ref); }
	return;
}

function reduceAlpha(_obj, _amount = 0.005, _destroyWhen0 = true, _reachedFinalAlphaMethod = function() {})
{
	_obj.image_alpha -= _amount;
	if (_destroyWhen0)
	{
		if (_obj.image_alpha <= 0) { instance_destroy(_obj); }	
	}
	else
	{
		if (_obj.image_alpha <= 0) { _reachedFinalAlphaMethod(); }	
	}
	return;
}

function increaseDimAlpha(_obj, _amount = 0.005, _finalAlpha = 1, _finalDimension = 0.8, _reachedFinalAlphaMethod = function() {})
{
	if (_obj.image_alpha < _finalAlpha) { _obj.image_alpha += _amount; }
	if (_obj.image_xscale < _finalDimension)
	{
		_obj.image_xscale += _amount;
		_obj.image_yscale += _amount;		
	
	} else { _reachedFinalAlphaMethod(); }
	return;	
}

function increaseAlpha(_obj, _amount = 0.005, _finalAlpha = 1, _reachedFinalAlphaMethod = function() {})
{
	if (_obj.image_alpha < _finalAlpha) { _obj.image_alpha += _amount; }
	else { _reachedFinalAlphaMethod(); }  
	return;	
}