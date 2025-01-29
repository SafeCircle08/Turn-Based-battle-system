for (var i = 0; i < numberOfMagnets; i++)
{
	var _xx = global.boxOriginX - (global.borderWidth / 2) - 60
	var _yy = global.boxOriginY - (global.borderHeight / 2) - 5
	draw_sprite(sRedPointer, bossIndex, _xx + global.boxOriginX + (global.borderWidth / 2) - 15, _yy + (17 * i) + 17);
}

bossIndex += 0.07;
if (bossIndex == image_number) { bossIndex = 0 }
draw_sprite_ext(sPeriodicTable, bossIndex, global.boxOriginX, global.boxOriginY, 1, 1, image_angle, c_white, 0.2);