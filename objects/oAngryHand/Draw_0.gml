draw_self();

if (image_xscale >= 0.5)
{	
	rot += 5;
	if (rot >= 720) { rot = 0; }
	faceTofaceTimer = setTimer(faceTofaceTimer);
	if (faceTofaceTimer == 0)
	{
		var _col = make_color_rgb(240, 0, 100)
		var _xDr = room_width / 2;
		var _yDr = (room_width / 2) - 75;
		
		var _xx = _xDr + irandom_range(-1, 1);
		var _yy = _yDr + irandom_range(-1, 1);
		_xx = clamp(_xx, _xDr - 0.4, _xDr + 0.4);
		_yy = clamp(_yy, _yDr - 0.4, _yDr + 0.4);
		
		if (drawAlpha < 1) { drawAlpha += 0.005; }
		draw_set_alpha(drawAlpha);
		draw_sprite(sFaceTofaceBG, 0, room_width / 2, room_height / 2 - 75);
		draw_sprite(sFaceToface, 0, _xx, _yy - 45);
		draw_set_font(fSteamPunkTalk);
		draw_sprite_ext(sFtGear, 0, room_width / 2 - 105, room_height / 2 - 75, 1, 1, rot, c_white, drawAlpha);
		draw_sprite_ext(sFtGear, 0, room_width / 2 + 105, room_height / 2 - 75, 1, 1, rot, c_white, drawAlpha);
		draw_set_halign(fa_center);
		draw_set_color(_col);
		draw_text(room_width / 2, room_height / 2 + 75, "Happy now?");
		draw_set_halign(fa_left);
		draw_set_color(c_white);
	}
}
draw_set_alpha(1);