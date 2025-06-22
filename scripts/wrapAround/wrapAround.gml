function wrapAround(_spr)
{
	var _w = sprite_get_width(_spr);
	var _h = sprite_get_height(_spr);
	var _camW = camera_get_view_width(view_camera[view_current]);
	var _camX = camera_get_view_x(view_camera[view_current]);
	
	if (self.x + _w < _camX) { self.x = _camW; }
}  