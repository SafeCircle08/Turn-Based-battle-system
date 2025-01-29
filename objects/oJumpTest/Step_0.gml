event_inherited();

if (global.created == false)
{
	for (var i = 0; i < 4; i++)
	{
		instance_create_layer((90 * i), room_height/2 - 20, "ExtrasObjects", oPlatform)
		instance_create_layer((60 * i), room_height/2 -60, "ExtrasObjects", oPlatform)	
		if (i == 3) 
		{ 
			var _xx = global.boxOriginX - (global.borderWidth / 2);
			var _yy = global.boxOriginY + (global.borderHeight / 2);
			instance_create_layer(_xx, _yy, "ExtrasObjects", oWaveTrigger); 
			global.created = true; 
		}
	}
}

var _created = false;
if (_created == false) { instance_create_layer(160, 120, layer, oPlatform); _created = true;}
if (instance_exists(oPlatform)) { _created = true; }