event_inherited();
randomize();

if (global.created == false)
{
	if (global.createTimer > 0) { global.createTimer-- }
	if (global.createTimer == 0)
	{
		for (var i = 0; i < 2; i++)
		{
			var _index = irandom_range(0, array_length(chemistryBulletsYs) - 1);
			var _xx = (global.boxOriginX + (global.borderWidth / 2) + 20);
			instance_create_layer(_xx + 40, chemistryBulletsYs[_index], "Bullets", oChemistryBullet);
			if (i == 0) { instance_create_layer(_xx + 40, chemistryBulletsYs[array_length(chemistryBulletsYs) - 1], "Bullets", oChemistryBullet); }
			if (i == 1) { global.createTimer = 120 }
		}
	}	
}