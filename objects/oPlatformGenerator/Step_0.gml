event_inherited();
if (global.created == false)
{
	for (var i = 0; i < 4; i++)
	{
		var _yy = global.boxOriginY;
		
		instance_create_layer(room_width + (sprite_get_width(sPlatform) * 2 * i), _yy + (_yy / 2) - 50, "ExtrasObjects", oPlatformLeft)
		instance_create_layer(-200 + (sprite_get_width(sPlatform) * 3 * i), _yy - 10 , "ExtrasObjects", oPlatformRight)	
		if (i == 3) 
		{ 
			var _xx = global.boxOriginX - (global.borderWidth / 2);
			var _yy = global.boxOriginY + (global.borderHeight / 2);
			instance_create_layer(_xx, _yy, "ExtrasObjects", oWaveTrigger); 
			global.created = true; 
		}
	}
}

/*
var _created = false;
if (_created == false) { instance_create_layer(160, 120, layer, oPlatform); _created = true;}
if (instance_exists(oPlatform)) { _created = true; }