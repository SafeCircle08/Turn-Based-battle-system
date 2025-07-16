randomize();

angleAdder = 10;
hasGravity = false;

if (instance_exists(global.eqDrumPad))
{
	x = global.eqDrumPad.x;
	y = global.eqDrumPad.y - 20;
	vspeed = irandom_range(-1, -2);
	hspeed = irandom_range(-4, -2);
	gravity = 0.1;

	xScales = [0.4, 0.5, 1, 1.1, 1.1];
	index = irandom_range(0, array_length(xScales) - 1);

	image_xscale = xScales[index];
	image_yscale = image_xscale;
}