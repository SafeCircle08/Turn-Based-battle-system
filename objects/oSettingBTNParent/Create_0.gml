minAlphaRef = 0.1;
maxAlphaRef = 1;
image_alpha = 1;

performFunction = function() {};
attachedX = 0;
attachedY = 0;
text = "";
textKey = "";
drawAlpha = 0;
textX = 0;
finalX = attachedX;
secondKey = vk_space;

function mouseHoover(_xPos, _yPos, _width, _height)
{
	return (mouse_x >= _xPos) && (mouse_x <= x + _width) &&
		   (mouse_y >= _yPos) && (mouse_y <= y + _height)	
}

function pressed(secondKey)
{
	return keyboard_check_pressed(secondKey) ||
		   mouse_check_button_pressed(mb_left)
}	