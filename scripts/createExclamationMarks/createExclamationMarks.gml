function createExclamationMarks(_xLoffSet = 0, _xRoffSet = 0, yUoffSet = 0, _yDoffSet = 0)
{
	audio_play_sound(sndExclamation, 50, false);
	for (var i = 0; i < 4; i++)
	{
		var _xL = global.boxOriginX - (global.borderWidth / 2) + _xLoffSet;
		var _xR = global.boxOriginX + (global.borderWidth / 2) + _xRoffSet;
		var _yU = global.boxOriginY - (global.borderHeight / 2) + yUoffSet;
		var _yD = global.boxOriginY + (global.borderHeight / 2) + _yDoffSet;
		var _xPos = [_xL + 10, _xR - 10, _xL + 10, _xR - 10];
		var _yPos =[_yU + 10, _yU + 10, _yD - 10, _yD - 10];
		instance_create_layer(_xPos[i], _yPos[i], "Bullets", oExclamationMark)
	}
}