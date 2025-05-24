event_inherited();
canShoot = false;
image_index = 0;

var _collidingShell = instance_place(x, y, oShell);
var _collidingWrongShell = instance_place(x, y, oBadShell);
if (_collidingShell != noone or _collidingWrongShell != noone)
{
	image_index = 1;
	canShoot = true;
}