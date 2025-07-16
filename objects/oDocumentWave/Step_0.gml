timer = setTimer(timer);

if (timer == 0)
{
	for (var i = 0; i < 2; i++)
	{
		var _xxL = irandom_range(0, global.border_l - 40);
		var _xxR = irandom_range(global.border_r + 40, room_width);
		var _xPos = [_xxL, _xxR];
		var _xIndex = irandom_range(0, 1);
		var _yy = room_height + irandom_range(20, 60);
		document = instance_create_layer(_xPos[_xIndex], _yy, LAYER_EXTRAS_OBJECTS, oDocument);
	}
	timer = 10;
}	