function changeDim(_obj, finalScaleX, finalScaleY, _amount = 0.02, _sign = 1, _destroyWhenReached = false)
{
	//The actual logig
	if (_obj.image_xscale < finalScaleX) { _obj.image_xscale += _amount * _sign; }
	if (_obj.image_yscale < finalScaleY) { _obj.image_yscale += _amount * _sign; }
	
	//Finished
	if (_obj.image_xscale == finalScaleX * _sign) && (_obj.image_yscale == finalScaleY * _sign)
	{
		if (_destroyWhenReached) { instance_destroy(_obj); } 	
	}
	return;
}

function changeAlpha(_obj, finalAlpha, _amount = 0.05, _destroyWhen0 = true)
{
	//The actual logic
	if (_obj.image_alpha < finalAlpha) { _obj.image_alpha += _amount; }
	else { _obj.image_alpha -= _amount; }
	
	//Clamp the value
	_obj.image_alpha = clamp(_obj.image_alpha, 0, 1);
	
	//Finished
	if (_obj.image_alpha == finalAlpha)
	{
		if (_destroyWhen0) { instance_destroy(_obj); }
	}
	return;
}


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