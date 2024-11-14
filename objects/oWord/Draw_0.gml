randomize();

if (wordDeelay > 0) { wordDeelay--; }

if (wordDeelay == 0)
{
	for (var i = 0; i < 3; i++)
	{
		var _xx = irandom_range(global.boxOriginX - (global.borderWidth / 2) * 2, global.boxOriginX + (global.borderWidth / 2) * 2)
		var _yy = irandom_range(global.boxOriginY - (global.borderHeight / 2) * 2, global.boxOriginY + (global.borderHeight / 2) * 2)
		var _scale = irandom_range(1, 3);
		var _angle = irandom_range(0, 270);
		draw_set_color(c_red);
		draw_text_ext_transformed(_xx, _xx, string(global.word), 5, 20, _scale, _scale, _scale);
		wordDeelay = 10;
	}
}

draw_self();
