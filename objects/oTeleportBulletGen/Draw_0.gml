var _positions = 
[
	//X origin
	[130, 225, 127, 278, 48],
	//Y origing
	[100, 95, 96, 159, 142],
	//Width
	[384, 192, 128, 64, 40],
	//Heigth
	[384, 192, 128, 64, 40],
];

if (changeTimer <= 50)
{
	draw_line_color
	(
		oSoul.x,
		oSoul.y,
		_positions[0][index],
		_positions[1][index],
		c_red,
		c_red
	);
}

draw_set_color(c_white);
draw_set_halign(fa_center)
draw_set_font(fText)

draw_set_color(c_black);
draw_text_ext_transformed(global.boxOriginX - 29, global.boxOriginY - 9, string(changeTimer), 20, 250, 0.55, 0.55, image_angle);
draw_set_color(c_red);
draw_text_ext_transformed(global.boxOriginX - 30, global.boxOriginY - 10, string(changeTimer), 20, 250, 0.5, 0.5, image_angle);

draw_set_color(c_white);
draw_set_halign(fa_left);