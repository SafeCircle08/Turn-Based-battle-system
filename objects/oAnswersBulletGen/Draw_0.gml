var _xShake = irandom_range(-1 , 1);
var _yShake = irandom_range(-1, 1);
var _xx = 215
var _yy = 50

if (global.actualQuestion != -1)
{
	timer--;
	var _x = global.boxOriginX;
	var _y = global.boxOriginY;
	var _w = sprite_get_width(sLittleRectangle) / 2;
	var _sprW = _w * 3;
	draw_sprite_stretched(sLittleRectangle, 0, _x - 100, 5, _sprW, 40)
	draw_set_font(fText);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_ext_transformed(oBattleBox.x, (oBattleBox.y - 108), global.questions[global.actualQuestion], 10, 500, 0.5, 0.5, 0);
	draw_text_ext_transformed(oBattleBox.x, (oBattleBox.y - 98), global.possibleAnswers[global.actualQuestion], 10, 500, 0.5, 0.5, 0);
	draw_set_color(c_red);
	draw_text_transformed(oBattleBox.x, oBattleBox.y - 88, string(timer), 0.5, 0.5, 0);
	draw_set_color(c_white);	
	draw_set_halign(fa_left);
}

draw_self();
