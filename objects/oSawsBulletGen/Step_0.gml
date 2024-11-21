event_inherited();
if (global.createTimer > 0) { global.createTimer-- }


if (global.created == false)
{
	if (global.createTimer == 0)
	{
		var _index = irandom_range(0, 3);
		for (var i = 0; i < 2; i++)
		{
			sawSpeedX = sawsArr[_index][3][i];
			sawsSpedY = sawsArr[_index][4][i];
			instance_create_layer(sawsArr[_index][1][i], sawsArr[_index][2][i], "Bullets", sawsArr[_index][0][i]);	
		}
		global.createTimer = 60;
	}
}

if (keyboard_check_pressed(ord("P"))) { oSoul.state = oSoul.stateGravity; }
if (keyboard_check_pressed(ord("L"))) { oSoul.state = oSoul.stateGravityUp; }