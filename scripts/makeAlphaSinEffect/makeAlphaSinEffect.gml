function makeAlphaSinEffect(_yAdder, _xAdder, _layer, _amplitude, _FXsprite,_nOfFXs, _oneNotMoving = 0, _xScale = 1, _yScale = 1, attached = false)
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
			var _stillObj = instance_create_layer(x, y + _yAdder + (_yAdder * i), _layer, oAlphaSinFX);
			_stillObj.image_xscale = _xScale;
			_stillObj.image_yscale = _yScale;
			_stillObj.sprite_index = _FXsprite;
			_stillObj.image_speed = image_speed;
			_stillObj.sining = false;
		}
		var _mySinAlphaFXObj = instance_create_layer(x, y + _yAdder + (_yAdder * i), _layer, oAlphaSinFX);
		_mySinAlphaFXObj.image_speed = image_speed;
		_mySinAlphaFXObj.image_xscale = _xScale;
		_mySinAlphaFXObj.image_yscale = _yScale;
		_mySinAlphaFXObj.sprite_index = _FXsprite;
		_mySinAlphaFXObj.image_alpha = 0.9 - (0.2 * i); 
		_mySinAlphaFXObj.amplitude = _amplitude + (_amplitude * i);
		_mySinAlphaFXObj.frequence = 0.006;
		_mySinAlphaFXObj.timerValue = 90 + (1 * i);
		_mySinAlphaFXObj.attached = attached;
	}
	return;
}