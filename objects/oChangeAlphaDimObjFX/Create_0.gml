startXScale = 0;
startYScale = 0;
finalXScale = 0;
finalYScale = 0;
startAlpha = 1;
finalAlpha = 0;

alphaSign = 1; //positive ->add / negative -> remove
alphaAmount = 0;

scaleSign = 1;
scaleAmount = 0;

rotates = false;
rotationAmount = 0;
frame = 0;

sprite_index = sBandagesItem;
image_speed = 0;

rotation = function(_rotAmount)
{
	frame += 0.5;
	image_angle += 	_rotAmount * (frame / 3);
}