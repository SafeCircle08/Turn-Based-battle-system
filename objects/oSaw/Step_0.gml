/// @description Insert description here
// You can write your code in this editor
if (destroyTimer > 0) { destroyTimer--; }

x += xspd;
y += yspd;

if (destroyTimer == 0)
{
	if (x > room_width + 50 or x < -50) { instance_destroy(self); }	
	if (y > room_height + 50 or y < -50) { instance_destroy(self); }
}