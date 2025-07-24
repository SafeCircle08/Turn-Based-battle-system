function makeAlphaSinEffect(_yAdder, _xAdder, _layer, _FXsprite, _amplitude, _nOfFXs, _oneNotMoving = 0)
{
	//Error catch
	if (!layer_exists(_layer)) 
	{
		show_error("Layer of Alpha Sin not found", true);
	}
	
	//Creating the effects
	for (var i = 0; i < _nOfFXs + _oneNotMoving; i++)
	{
		if (_oneNotMoving) && (i == 0)
		{
			var _stillObj = instance_create_layer(x, y + _yAdder + (_yAdder * i), _layer, oSuperimposedFX);
			_stillObj.sprite_index = _FXsprite;
			_stillObj.sining = false;
		}
		var _mySinAlphaFXObj = instance_create_layer(x, y + _yAdder + (_yAdder * i), _layer, oSuperimposedFX);
		_mySinAlphaFXObj.sprite_index = _FXsprite;
		_mySinAlphaFXObj.image_alpha = 0.9 - (0.2 * i); 
		_mySinAlphaFXObj.amplitude = _amplitude + (_amplitude * i);
		_mySinAlphaFXObj.frequence = 0.006;
		_mySinAlphaFXObj.timerValue = 90 + (1 * i);
	}
	return;
}