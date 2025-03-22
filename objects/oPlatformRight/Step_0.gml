//VA A DESTRA
x += 1;
if (x > room_width + (sprite_get_width(sPlatform) / 2)) 
{ 
	x = 0 - (sprite_get_width(sPlatform) / 2);
}
