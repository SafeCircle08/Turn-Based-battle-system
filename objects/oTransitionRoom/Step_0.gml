//Set the right pos
x = oCamera.finalCamX;
y = oCamera.finalCamY;


//Fade in
if (reached1 == false)
{
	changeAlpha(self, 1, amount, false);
}

//Changes the room
if (image_alpha == 1) 
{ 
	reached1 = true;
	oPlayerOW.canMove = true;
	changeRoom(destination, playerX, playerY);
}

if (reached1 == true)
{
	fadeOutTimer = setTimer(fadeOutTimer);
	if (fadeOutTimer == 0)
	{
		canFadeOut = true;		
	}
}

//Fades out and destroy
if (canFadeOut == true)
{
	changeAlpha(self, 0, amount, true);	
}