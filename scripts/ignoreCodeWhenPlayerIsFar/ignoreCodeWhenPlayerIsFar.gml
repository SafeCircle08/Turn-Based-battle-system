function isDistant()
{
	var _xValue = camera_get_view_width(view_camera[view_current]) / 2;
	var _yValue =  camera_get_view_height(view_camera[view_current]) / 2;
	var _xValueAdder = sprite_get_width(sprite_index) / image_xscale;
	var _yValueAdder = sprite_get_height(sprite_index) / image_yscale;
	
	var _distanceX = _xValue + _xValueAdder;
	var _distanceY = _yValue + _yValueAdder;
	
	return (distance_to_object(oPlayerOW) > _distanceX) ||
		   (distance_to_object(oPlayerOW) > _distanceY)
}