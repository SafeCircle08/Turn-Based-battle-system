key_right = keyboard_check(ord("D")); 
key_left = keyboard_check(ord("A")); 
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

key_rightPr = keyboard_check_pressed(ord("D")); 
key_leftPr = keyboard_check_pressed(ord("A")); 
key_upPr = keyboard_check_pressed(ord("W"));
key_downPr = keyboard_check_pressed(ord("S"));

hsp = (key_right - key_left) * global.SoulSpeed;
vsp = (key_down - key_up) * global.SoulSpeed;
	
if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
if (key_upPr) { sprite_index = sPlayerOwBehind; }
if (key_downPr) { sprite_index = sPlayerOwFront; }
if (key_rightPr) { sprite_index = sPlayerOwRight; }
if (key_leftPr) { sprite_index = sPlayerOwLeft; }
	
if (key_down) { sprite_index = sPlayerOwFront; image_speed = 1; }
if (key_left) { sprite_index = sPlayerOwLeft; image_speed = 1; }
if (key_up) { sprite_index = sPlayerOwBehind; image_speed = 1; }
if (key_right) { sprite_index = sPlayerOwRight; image_speed = 1; }


if (place_meeting(x + hsp, y, oWall)) { hsp = 0; image_speed = 0; image_index = 0; } 
if (place_meeting(x, y + vsp, oWall)) { vsp = 0; image_speed = 0; image_index = 0; } 

x += hsp;
y += vsp;