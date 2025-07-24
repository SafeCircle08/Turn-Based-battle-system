//if (!instance_exists(oPlayerOW)) { instance_destroy(view_camera[0]) }

if (keyboard_check_pressed(vk_f12))
{
	window_set_fullscreen(!window_get_fullscreen());
}

var _camW = camera_get_view_width(view_camera[view_current]);
var _camH = camera_get_view_height(view_camera[view_current]);
var _camX = oPlayerOW.x - _camW / 2;
var _camY = oPlayerOW.y - _camH / 2;	
var _camera = view_camera[view_current];

_camX = clamp(_camX, 0, room_width - _camW);
_camY = clamp(_camY, 0, room_height - _camH);

finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;

finalCamX = lerp(finalCamX, _camX, 0.1);
finalCamY = lerp(finalCamY, _camY, 0.1);

camera_set_view_pos(_camera, finalCamX, finalCamY);

/*
if (room == rmBannerBridge)
{
	layer_x("SkyBG", finalCamX / 4);	
	layer_x("FarStars", finalCamX / 6);
	layer_x("TreeBG", finalCamX / 10);
	layer_x("RandomStructures", finalCamX / 17);
	layer_x("FlyingLeaves", finalCamX / 20);
}