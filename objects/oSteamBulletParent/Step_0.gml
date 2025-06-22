/// @description Insert description here
// You can write your code in this editor
image_alpha = clamp(image_alpha, 0, 1)
image_alpha += 0.05;
frame += 0.02 * accValue;

if (acceleration = true)
{
	y += yspd * frame;
	x += xspd * frame;
}
else
{
	y += yspd;
	x += xspd;
}

if (image_alpha >= 1)
{
	if (y < global.border_u || y > global.border_d) { reduce = true; }
	if (x < global.border_l || x > global.border_r) { reduce = true; }
}	

if (reduce == true) 
{ 
	image_alpha -= 0.05; 
	if (image_alpha <= 0) { instance_destroy(self); }
}

image_alpha = clamp(image_alpha, 0, 1);