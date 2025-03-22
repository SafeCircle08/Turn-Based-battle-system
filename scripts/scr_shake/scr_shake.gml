function scr_shake(_shakeX, _shakeY, _timer, _canShake)
{
	if _canShake == true
	{
		var _viewX = camera_get_view_x(view_camera[0]);
		var _viewY = camera_get_view_y(view_camera[0]);
		_shakeX = irandom_range(-1, 1);
		_shakeY = irandom_range(-1, 1);
		camera_set_view_pos(view_camera[0],_viewX + _shakeX, _viewY + _shakeY);
		_timer--;
		if (_timer < 0) { _canShake = false; }
	}
	else
	{
		camera_set_view_pos(view_camera[0], view_x, view_y);
	}
}