changeAlpha(self, 1, 0.07, false);

if (!keyboard_check(ord("Q")))
{
	instance_destroy(self);	
}

if (instance_exists(oCamera))
{
	//If the camera moves
	x = oCamera.finalCamX + 1 + xAdder;
	y = oCamera.finalCamY + 1;
}
else
{
	//If the view is still
	x = 5;
	y = 5;
}
xAdder += 10;
xAdder = clamp(xAdder, -32, 0);

//Exits the game
if (image_index >= image_number) { game_end(); } 
