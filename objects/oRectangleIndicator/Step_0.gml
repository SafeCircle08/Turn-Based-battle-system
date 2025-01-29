weight = clamp(weight, 0, 100);

if (weight == 100)
{
	weight = 0;
	oSoul.fxIndex = 3;
	global.fxColor = c_yellow;
	instance_create_layer(oSoul.x, oSoul.y, "ExtrasObjects", oPlayerEffect);
}