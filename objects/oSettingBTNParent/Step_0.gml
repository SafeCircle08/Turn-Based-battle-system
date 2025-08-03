var _w = sprite_get_width(sprite_index);
var _h = sprite_get_height(sprite_index);

var _cameraW = camera_get_view_width(view_camera[view_current]);
var _cameraH = camera_get_view_height(view_camera[view_current]);
var _myX = oCamera.finalCamX + _cameraW - 18;
var _myY = oCamera.finalCamY + attachedY + 2;

x = _myX;
y = _myY;

if keyboard_check_pressed(secondKey) { performFunction(); }

//If windowed mode, you see the cursor
if (mouseHoover(x, y, _w, _h))
{
	changeAlpha(self, maxAlphaRef, 0.05, false);
	if mouse_check_button_pressed(mb_left) { performFunction(); }
	drawAlpha += 0.05;
	textX -= 0.5;
}
else
{
	changeAlpha(self, minAlphaRef, 0.05, false);
	drawAlpha -= 0.05;
	textX += 0.5;
}		

//Clamping values
drawAlpha = clamp(drawAlpha, 0, 1);
if (drawAlpha <= 0) { textX = 0; }
else { textX = clamp(textX, -3, 0); }