for (var i = 0; i < numberOfMagnets; i++)
{
	var _xx = global.boxOriginX - (global.borderWidth / 2) - 60
	var _yy = global.boxOriginY - (global.borderHeight / 2) - 5
	if (magnetsX < 41) { magnetsX += 0.05 }
	draw_sprite(sMagnet, 0, _xx + magnetsX, _yy + (17 * i) + 5);
	draw_sprite(sRedPointer, bossIndex, _xx + global.boxOriginX + (global.borderWidth / 2) - 15, _yy + (17 * i) + 17);
	array_push(chemistryBulletsYs, _yy + (17 * i) +  1);
}

bossIndex += 0.07;
if (bossIndex == image_number) { bossIndex = 0 }
draw_sprite_ext(sPeriodicTable, bossIndex, global.boxOriginX, global.boxOriginY, 1, 1, image_angle, c_white, 0.2);