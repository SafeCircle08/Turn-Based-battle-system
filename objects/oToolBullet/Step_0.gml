y -= dropSpd;

image_angle += 2;

if (y >= global.border_d)
{
	instance_create_layer(x, y, "Bullets", oToolExplosion);
	var _vsps = [-5, -4.2, -4];
	var _hsps = [-1, 0.7, 1];
	for (var i = 0; i < 3; i++)	
	{
		var _index = irandom_range(0, array_length(_vsps) - 1);
		var bullet = instance_create_layer(x, y, "Bullets", oToolDebri,
		{
			vspeed: _vsps[i],
			hspeed: _hsps[_index] + irandom_range(-0.2, 0.2),
			gravity: 0.1
		});
	}
	oShake.shake = true;
	instance_destroy(self);
}