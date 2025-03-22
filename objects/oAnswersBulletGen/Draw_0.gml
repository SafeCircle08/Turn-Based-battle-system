var _xShake = irandom_range(-1 , 1);
var _yShake = irandom_range(-1, 1);
var _xx = 215
var _yy = 50

if (global.actualQuestion != -1)
{
	timer--;
	draw_sprite_stretched(sLittleRectangle, 1, oBattleBox.x - sprite_get_width(sBattleBox), 5, sprite_get_width(sBattleBox) * 2, 40)
	draw_set_font(fText);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text_ext_transformed(oBattleBox.x, (oBattleBox.y - 90), global.questions[global.actualQuestion], 10, 500, 0.5, 0.5, 0);
	draw_text_ext_transformed(oBattleBox.x, (oBattleBox.y - 80), global.possibleAnswers[global.actualQuestion], 10, 500, 0.5, 0.5, 0);
	draw_set_color(c_red);
	draw_text_transformed(oBattleBox.x, oBattleBox.y - 70, string(timer), 0.5, 0.5, 0);
	draw_set_color(c_white);	
	draw_set_halign(fa_left);
}

draw_self();
