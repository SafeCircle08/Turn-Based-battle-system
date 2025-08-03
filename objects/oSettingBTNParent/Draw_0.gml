if (drawAlpha > 0)
{
	draw_self();
	var _cameraW = camera_get_view_width(view_camera[view_current]);
	var _cameraH = camera_get_view_height(view_camera[view_current]);
	var _myX = oCamera.finalCamX + _cameraW - 18;
	var _myY = oCamera.finalCamY + attachedY + 2;
	var _w = sprite_get_width(sprite_index);
	var _h = sprite_get_height(sprite_index);

	draw_set_valign(fa_middle);
	draw_set_font(fFontino);
	draw_set_alpha(drawAlpha);

	var _sprH = sprite_get_width(sQuitButton) / 2;
	var _finalX = _myX - string_width(text) + textX;
	var _textX = lerp(_myX, _finalX, 1);

	//The bg of text
	draw_set_color(c_black);
	draw_text_ext_transformed(_finalX + 1, _myY + _sprH + 1, text, 5, 999, 1, 1, 0);
	//The actual text
	draw_set_color(c_white);
	draw_text_ext_transformed(_finalX, _myY + _sprH, text, 5, 999, 1, 1, 0);

	draw_set_valign(fa_top);
	draw_set_alpha(1);
}