function createObstacleWall(_obsN, _randomOffset = true)
{
	var _middleWall = [];
	if (_randomOffset)
	{
		//Managment variables
		var _length = array_length(possiblePlayerYpos);
		var _offsetAbsValue = floor(_length / 2);
		var _offset = irandom_range(-_offsetAbsValue, _offsetAbsValue);
	
		//Loop that creates the obstacles
		for (var i = 0; i < _obsN; i++)
		{
			var _index = i + _offset + _offsetAbsValue;
			_index = clamp(_index, 0, array_length(possiblePlayerYpos) - 1);
			_middleWall[i] = possiblePlayerYpos[_index];
			instance_create_layer(room_width + 40, _middleWall[i], LAYER_BULLETS, oCartObstacle);
		}
	}
	return;
}