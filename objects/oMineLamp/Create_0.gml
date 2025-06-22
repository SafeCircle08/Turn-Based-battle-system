frame = irandom_range(40, 100);
spd = 2;
falling = false;
setValues = false;

fallingFunction = function()
{
	image_angle += 1;
	if (y > room_height + 50) { instance_destroy(self); }
}