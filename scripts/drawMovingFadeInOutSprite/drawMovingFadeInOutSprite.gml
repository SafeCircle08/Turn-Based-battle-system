function drawFadeInSpriteStretched(_spr, _x, _y, _alpha, _xAdder, _xScale = sprite_get_width(_spr), _yScale = sprite_get_height(_spr))
{
	draw_sprite_stretched_ext(_spr, 0, _x + _xAdder, _y, _xScale, _yScale, c_white, _alpha);
}	

function drawFadeOutSpriteStretched(_spr, _x, _y, _alpha, _xAdder, _xScale = sprite_get_width(_spr), _yScale = sprite_get_height(_spr))
{
	if (_alpha > 0)
	{
		draw_sprite_stretched_ext(_spr, 0, _x + _xAdder, _y, _xScale, _yScale, c_white, _alpha); 	
	}
}

function drawFadeInSprite(_spr, _x, _y, _alpha, _xAdder)
{
	draw_sprite_ext(_spr, 0, _x + _xAdder, _y, 1, 1, 0, c_white, _alpha);
}	

function drawFadeOutSprite(_spr, _x, _y, _alpha, _xAdder)
{
	if (_alpha > 0)
	{
		draw_sprite_ext(_spr, 0, _x + _xAdder, _y, 1, 1, 0, c_white, _alpha);
	}
}