x++;

if (x > 0)
{
	y = sine_wave(x * 10/ 1000, 1, 12, ystart);
}

if (x > room_width) { instance_destroy(self);}