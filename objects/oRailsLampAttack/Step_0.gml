event_inherited();
//Creates the crossair (the scpe)
if (global.enemyTimer == lampTimer[lampNumber] - 20) 
{
	var _lamp = lamps[lampNumber];
	if (!instance_exists(oCrossAir))
	{
		var _cross = instance_create_layer(_lamp.x, _lamp.y, LAYER_EFFECT, oCrossAir);
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
	instance_create_layer(_lamp.x - 20, _lamp.y + 16, LAYER_EFFECT, oCircleEffect);		
}

//Section where it aims the actual lamps:
if (global.enemyTimer == lampTimer[lampNumber])
{
	var _shadowW = sprite_get_width(sShadow_1);
	instance_create_layer(room_width - ((_shadowW - 30) * lampNumber), 0, LAYER_EXTRAS_OBJECTS, oShadow_1);
	var _lamp = lamps[lampNumber];
	_lamp.falling = true;
	oCrossAir.fading = true;
	lampNumber++;
	lampNumber = clamp(lampNumber, 0, 3);
}