function mouseCursorIsOn(_xPos, _yPos, _width, _height)
{
	return (mouse_x >= _xPos) && (mouse_x <= _width) &&
		   (mouse_y >= _yPos) && (mouse_y <= _height)
}