if (canScroll == true)
{
	if (frame == -1)
	{
		oShake.shake = true;
		frame = 0;
	}
	frame += 0.05;
	y += frame * frame;
	frame = clamp(frame, 0, 5);
	var _w = sprite_get_height(sBackGround) + 50;

	if (y > room_height + _w)
	{
		y = -50;
	}
}