amplitude = 0;
timerValue = 0;
frequence = 0;
startImageAlpha = noone;
frame = 0;
sining = true;
attached = false;
caller = 0;

battleGUIFunction = function()
{
	var _height = sprite_get_height(sInventory) * image_yscale;
	x = oBattleManager.startButtonX	+ cos(timerValue) * amplitude + 45;
	y = room_height / 4 + (_height) - 5;
}