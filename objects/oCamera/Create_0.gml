overWorldCam = camera_create_view(0, 0, 288, 216);
view_set_camera(0, overWorldCam);

var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);
finalCamX = oPlayerOW.x - (_w / 2);
finalCamY = oPlayerOW.y - (_h / 2);

camTrailSpd = 0.1;

function clampCameraValue()
{
	var _w = camera_get_view_width(view_camera[0]);
	var _h = camera_get_view_height(view_camera[0]);

	finalCamX = oPlayerOW.x - (_w / 2);
	finalCamY = oPlayerOW.y - (_h / 2);
	finalCamX = clamp(finalCamX, 0, room_width - _w);
	finalCamY = clamp(finalCamY, 0, room_height - _h);		
}