image_alpha = 0;
reached1 = false;
canFadeOut = false;
fadeOutTimer = 20;
amount = 0.05;
destination = 0;
playerX = 0;
playerY = 0;
oPlayerOW.canMove = false;


function setRightCameraPos()
{
	var _camW = camera_get_view_width(view_camera[view_current]);
	var _camH = camera_get_view_height(view_camera[view_current]);
	oCamera.finalCamX = oPlayerOW.x - (_camW / 2);
	oCamera.finalCamY = oPlayerOW.y - (_camH / 2);		
}

function changeRoom(_newRoom, _x, _y)
{
	//Actually changes the room
	room_goto(_newRoom);
	oPlayerOW.x = _x;
	oPlayerOW.y = _y;
}