x = oSoul.x;
y = oSoul.y + 4;

image_speed = 1;

if (oSoul.key_right != 0) || (oSoul.key_left != 0) 
{
	image_speed = 1.5;
	frame++;
	if (frame % 4 == 0)
	{
		var _sparksN = irandom_range(1, 5);
		for (var i = 0; i < _sparksN; i++)
		{
			var _angleSpd = irandom_range(5, 15);
			var _hspd = irandom_range(0, 0);
			var _grv = irandom_range(0.5, 0.1);
			var _vspd = irandom_range(-4, -2);
			
			//The spar properties:
			var _spark = instance_create_depth
			(
				x, 
				y, 
				-100, 
				oSparks,
				{
					x: oSoul.x + irandom_range(-10, -5), 
					y: oSoul.y + irandom_range(-5, 5),
					image_xscale: 0.1, 
					image_yscale: 0.1,
					vspeed: irandom_range(-5, -4),
					hspeed: irandom_range(-4, -2),
					gravity: 0.5
				}
			);
		}
	}
}

print(instance_number(oSparks))