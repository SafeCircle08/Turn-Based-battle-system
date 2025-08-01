event_inherited();

if (instance_number(oElectronCircular) < maxElectrons)
{
	var _posX =  [oSoul.x + 40, oSoul.y - 40];
	var _posY = [oSoul.y + 40, oSoul.y - 40];
	var _xx = global.boxOriginX;
	var _yy = global.boxOriginY;
	delayTimer = setTimer(delayTimer);
	if (delayTimer == 0)
	{
		var _electron = instance_create_layer(_xx, _yy, LAYER_BULLETS, oElectronCircular);
		_electron.image_angle = electronN * 30;
		_electron.angleRef = electronN * 30;
		if (electronN == 0) 
		{ 
			var trigger = instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oGeneralTrigger);
			trigger.image_xscale = 4.5;
			trigger.image_yscale = 4.5;
			trigger.xOffset = -37;
			trigger.yOffset = -37;
			trigger.following = oElectronCircular; 
			trigger.toucher = oSoul;
			trigger.touchingFunction = function() {};
			trigger.notTouchingFunction = function() 
			{ 
				timer++; 
				var _posX =  [oSoul.x + 40, oSoul.y - 40];
				var _posY = [oSoul.y + 40, oSoul.y - 40];
				if (timer == 10) { createExclamationMarks(); } 
				if (timer % 70 == 0)
				{
					var _index = irandom_range(0, 1);
					instance_create_layer(_posX[_index],  _posY[_index], LAYER_BULLETS, oKnife);		
				}
			}
		}
		delayTimer = 10;
		electronN++;
	}
}