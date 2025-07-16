event_inherited();
if (global.created == false)
{
	var _xx = global.boxOriginX - (global.borderWidth / 2);
	var _yy = global.boxOriginY + (global.borderHeight / 2);
	createPlatforms(4, 3);
	instance_create_layer(_xx, _yy, LAYER_EXTRAS_OBJECTS, oWaveTrigger); 
	global.created = true;
}