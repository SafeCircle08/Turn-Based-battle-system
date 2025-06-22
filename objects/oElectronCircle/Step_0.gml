event_inherited();

var _posX =  [oSoul.x + 40, oSoul.y - 40];
var _posY = [oSoul.y + 40, oSoul.y - 40];

if (instance_number(oElectronCircular) < maxElectrons)
{
	var _xx = global.boxOriginX;
	var _yy = global.boxOriginY;
	delayTimer = setTimer(delayTimer);
	if (delayTimer == 0)
	{
		var _electron = instance_create_layer(_xx, _yy, "Bullets", oElectronCircular);
		_electron.image_angle = electronN * 30;
		if (electronN == 0) 
		{ 
			var trigger = instance_create_layer(x, y, "ExtrasObjects", oGeneralTrigger);
			trigger.image_xscale = 74;
			trigger.image_yscale = 74;
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
					instance_create_layer(_posX[_index],  _posY[_index], "Bullets", oKnife);		
				}
			}
		}
		delayTimer = 10;
		electronN++;
	}
	exit;
}

delayTimer_2 = setTimer(delayTimer_2);
if (delayTimer_2 == 0)
{
	var _xx = irandom_range(global.border_l, global.border_r);
	var _yy = irandom_range(global.border_u, global.border_d);
	instance_create_layer(_xx, _yy, "ExtrasObjects", oBoxPointer);	
	delayTimer_2 = 70;
}