for (var i = 0; i < array_length(actualArray); i++)
{
	var _col = c_white;
	var _guiX = (room_width / 2 - 80) + xAdder;
	var _spriteWidth = sprite_get_width(sInventory);
	var _spriteHeight = sprite_get_height(sInventory);
	var _guiY = (room_height / 2 - 13) + yAdder;
	var _actualSep = 4 + (separationBuffer);
	
	if (!instance_exists(oBattleManager.itemOutput))
	{
		if (oBattleManager.invPos == i) { _col = make_color_rgb(216, 180, 70); }
		draw_set_color(_col);
	}
	draw_text_ext_transformed(_guiX, _guiY + 10 * i, (actualArray[i]), 20, _spriteWidth * 6, 0.5, 0.5, 0);
	draw_set_color(c_white);
}