hspeeds = [-2, 2];
hspeedsIndex = irandom_range(0, 1);

vspeed = irandom_range(-4, -2);
hspeed = hspeeds[hspeedsIndex];
gravity = 0.09;

maxXscale = 1.5;
maxYscale = maxXscale;
xScaleAdder = 0.005;
yScaleAdder = xScaleAdder;
alphaTimer = 0;

showDamage = 0;
adderDamage = 0;

image_xscale = 0.3;
image_yscale = 0.3;
image_alpha = 1;