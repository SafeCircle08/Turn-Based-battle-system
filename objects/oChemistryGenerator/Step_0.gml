event_inherited();
randomize();


if (global.created == false)
{
	if (magnetsCreated == false)
	{
		for (var i = 0; i < numberOfMagnets; i++)
		{
			var _xx = global.boxOriginX - (global.borderWidth / 2) - 60
			var _yy = global.boxOriginY - (global.borderHeight / 2) - 5
			instance_create_layer(_xx + magnetsX, _yy + (17 * i) + 5, LAYER_BULLETS, oMagnet);
			draw_sprite(sRedPointer, bossIndex, _xx + global.boxOriginX + (global.borderWidth / 2) - 15, _yy + (17 * i) + 17);
			array_push(chemistryBulletsYs, _yy + (17 * i) +  1);
			if (i = numberOfMagnets - 1) { magnetsCreated = true; }
		}
	}
	
	if (global.createTimer > 0) { global.createTimer-- }
	if (global.createTimer == 0)
	{
		for (var i = 0; i < 2; i++)
		{
			var _index = irandom_range(0, array_length(chemistryBulletsYs) - 1);
			var _xx = (global.boxOriginX + (global.borderWidth / 2) + 20);
			instance_create_layer(_xx + 40, chemistryBulletsYs[_index], LAYER_BULLETS, oChemistryBullet);
			if (i == 0) { instance_create_layer(_xx + 40, chemistryBulletsYs[array_length(chemistryBulletsYs) - 1], LAYER_BULLETS, oChemistryBullet); }
			if (i == 1) { global.createTimer = 120 }
		}
	}	
}