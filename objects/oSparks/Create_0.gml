randomize();
vspeed = irandom_range(-1, -2);
hspeed = irandom_range(-2, 2);
gravity = 0.1;
x = oDrumPad.x;
y = oDrumPad.y - 20;

xScales = [0.4, 0.5, 1, 1.1, 1.1];
index = irandom_range(0, array_length(xScales) - 1);

image_xscale = xScales[index];
image_yscale = image_xscale;