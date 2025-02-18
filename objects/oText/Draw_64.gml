for (var i = 0; i < array_length(actualArray); i++)
{
	var _col = c_white;
	var _guiX = (surface_get_width(application_surface) / 2) + xAdder;
	var _spriteWidth = sprite_get_width(sInventory);
	var _spriteHeight = sprite_get_height(sInventory);
	var _guiY = (surface_get_height(application_surface) - 250) + yAdder;
	var _actualSep = 4 + (separationBuffer);
	
	if (!instance_exists(oBattleManager.itemOutput))
	{
		if (oBattleManager.invPos == i) { _col = make_color_rgb(240, 0, 100) }
		draw_set_color(_col);
	}
	draw_text_ext(_guiX + 97, _guiY + 20 * i, (actualArray[i]), 20, _spriteWidth * _actualSep);
}
