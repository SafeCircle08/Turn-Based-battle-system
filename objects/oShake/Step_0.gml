if (shake == true)
{
	var _shakeX = irandom_range(-1, 1);
	var _shakeY = irandom_range(-1, 1);
	camera_set_view_pos(view_camera[0], view_x + _shakeX, view_y + _shakeY);
	shakeTimer--;
	if (shakeTimer < 0) 
	{ 
		shake = false; shakeTimer = 15;
		camera_set_view_pos(view_camera[0], view_x, view_y);
	}
}
else
{
	camera_set_view_pos(view_camera[0], view_x, view_y);
}