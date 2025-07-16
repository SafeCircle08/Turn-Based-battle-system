function createPlatforms(_lanes, _platformNum)
{
	var _startY = global.boxOriginY - (global.borderHeight / 2);
	for (var i = 1; i < _lanes; i++)
	{
		for (var j = 1; j < _platformNum + 1; j++)
		{
			var _platform = oPlatformRight;
			var _xx = - (room_width / _platformNum) * j;
			if (i % 2 == 0)
			{
				_platform = oPlatformLeft;
				_xx = room_width + (room_width / _platformNum) * j
			}
			instance_create_layer(_xx, _startY + (global.borderHeight / _lanes + 1) * i, LAYER_EXTRAS_OBJECTS, _platform);	
		}
	}
}