function createLiquid(_waveNum, _startY, _finalY, _waveAlpha)
{
	var _waveIndex
	if (_waveAlpha < 1) { _waveAlpha += 0.010; }
	_waveIndex += 0.05;
	
	if (_startY < _finalY) { _startY -= 0.08; }
	
	for (var i = 0; i < _waveNum; i++)
	{
		var _xx = (global.boxOriginX - (global.borderWidth / 2))
		var _width = sprite_get_width(sWave);
		draw_sprite_ext(sWave, _waveIndex, _xx + (i * _width), _startY, 1, 1, image_angle, c_white, _waveAlpha);
	}
	
}