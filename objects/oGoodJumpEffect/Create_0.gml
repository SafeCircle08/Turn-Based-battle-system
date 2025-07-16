if (!instance_exists(oSoul)) { instance_destroy(self); }

x = oSoul.x;
y = oSoul.y - 12;

refX = x;
refY = y + 12;

image_xscale = 0.3;
image_yscale = 0.3;
hspeed = 1;
vspeed = -1
gravity = 0.09;
reduceAlphaTimer = 50;
timer = 0;
duration = 30;
yellowPopping = false;

//play effect sound