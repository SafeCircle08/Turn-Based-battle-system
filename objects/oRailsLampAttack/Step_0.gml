event_inherited();
/*
var playerUpKey = keyboard_check_pressed(ord("W"));
var playerDownKey = keyboard_check_pressed(ord("S"));

//Creates the crossair (the scpe)
if (global.enemyTimer == lampTimer[lampNumber] - 20) 
{
	var _lamp = lamps[lampNumber];
	if (!instance_exists(oCrossAir))
	{
		var _cross = instance_create_layer(_lamp.x, _lamp.y, "Effect", oCrossAir);
		with (_cross)
		{
			xGoal = _lamp.id.x;
			yGoal = _lamp.id.y + 25;
		}
		_lamp.spd = 0;
	}
}

//Creates the circle effect
if (global.enemyTimer == lampTimer[lampNumber] - 10) 
{
	var _lamp = lamps[lampNumber];
	instance_create_layer(_lamp.x - 20, _lamp.y + 16, "Effect", oCircleEffect);		
}

//Section where it aims the actual lamps:
if (global.enemyTimer == lampTimer[lampNumber])
{
	var _lamp = lamps[lampNumber];
	_lamp.falling = true;
	oCrossAir.fading = true;
	lampNumber++;
	lampNumber = clamp(lampNumber, 0, 3);
}