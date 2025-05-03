if (draw == true)
{
	draw_self();
	image_angle += 0.5;
	if (image_alpha < 1) { image_alpha += 0.05; }
	if (image_angle == 360) { image_angle = 0; }


	var _col = make_color_rgb(240, 0, 100)
	var _borderW = global.borderWidth;
	var _borderH = global.borderHeight;
	var _originX = global.boxOriginX;
	var _originY = global.boxOriginY;

	global.border_l = (_originX - (currentWidth / 2));
	global.border_r = (_originX + (currentWidth / 2));
	global.border_u = (_originY - (currentHeight / 2)); 
	global.border_d = (_originY + (currentHeight / 2));
	draw_set_color(_col);

	if (animateBoxTimer == 0) && global.pov == "Up"
	{
		draw_sprite_stretched_ext
		(
			sOutSideBox, 
			0, 
			_originX - (_borderW / 2) - 20, 
			_originY - (_borderH / 2) - 20, _borderW + 41, 
			_borderH + 41, 
			_col, 
			1
		);
	}

	draw_rectangle(global.border_l - 4, global.border_u - 4, global.border_r + 4, global.border_d + 4, false);
	draw_set_color(c_black);
	draw_rectangle(global.border_l, global.border_u, global.border_r, global.border_d, false);
	draw_sprite_ext(sCenter, 0, _originX + global.xOffset, _originY + global.yOffset, 1, 1, 0, _col, 1);
	
	if (animateBoxTimer == 0) && global.pov == "SpiderPov"
	{
		draw_set_color(_col);
		draw_line_width(global.border_l + 20, global.border_u - 2, global.border_l + 20, global.border_d, 6);
		draw_line_width(global.border_r - 20, global.border_u - 2, global.border_r - 20, global.border_d, 3);
	}
}