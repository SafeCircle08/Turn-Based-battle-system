if (timerGetCoord == 0)
{
	//UPPER PART
	for (var i = 1; i < numberOfTubesWidth + 1; i++)
	{
		var _xx = global.boxOriginX - (global.borderWidth / 2);
		var _yy = global.boxOriginY - (global.borderHeight / 2) - 5;
		var _width = sprite_get_width(sTubeSteam);
		draw_sprite_ext(sTubeSteam, 0, _xx + (_width * i) - 10, _yy, 0.5, 0.5, 180, c_white, 1);
	}

	//BOTTOM PART
	for (var i = 1; i < numberOfTubesWidth + 1; i++)
	{	
		var _xx = global.boxOriginX - (global.borderWidth / 2);
		var _yy = global.boxOriginY + (global.borderHeight / 2) + 5;
		var _width = sprite_get_width(sTubeSteam);
		draw_sprite_ext(sTubeSteam, 0, _xx + (_width * i) - 10, _yy, 0.5, 0.5, 0, c_white, 1);
	}

	//LEFT PART
	for (var i = 1; i < numberOfTubesHeight + 1; i++)
	{
		var _xx = global.boxOriginX - (global.borderWidth / 2) - 5;
		var _yy = global.boxOriginY - (global.borderHeight / 2);
		var _height = sprite_get_width(sTubeSteam);
		draw_sprite_ext(sTubeSteam, 0, _xx, _yy + (_height * i) - 10, 0.5, 0.5, 270, c_white, 1);
	}

	//RIGHT PART
	for (var i = 1; i < numberOfTubesHeight + 1; i++)
	{	
		var _xx = global.boxOriginX + (global.borderWidth / 2) + 5;
		var _yy = global.boxOriginY - (global.borderHeight / 2);
		var _height = sprite_get_width(sTubeSteam);
		draw_sprite_ext(sTubeSteam, 0, _xx, _yy + (_height * i) - 10, 0.5, 0.5, 90, c_white, 1);
	}
}

draw_self();