var _bgW = sprite_get_width(sInventoryBG) * 3;

for (var i = 0; i < array_length(actualArray); i++)
{
	draw_text_ext_transformed(x, y + 10 * i, actualArray[i], 20, _bgW + 50, 0.5, 0.5, 0);
}