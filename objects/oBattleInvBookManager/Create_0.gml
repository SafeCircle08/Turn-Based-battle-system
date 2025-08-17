bookBgW = 68;
bookBgH = room_height * 2;
drawAlpha = 0;

//X Coords
bookStartX = room_width;
bookFinalX = room_width - bookBgW;
bookX = bookStartX;
startXRef = bookStartX;
finalXRef = bookFinalX;


//Y Coords
bookStartY = 0;
bookFinalY = bookBgH;
bookY = bookStartY;
startYRef = bookStartY;
finalYRef = bookFinalY;

//Animations
fadeInDone = false;
fadingOut = false;
scrollingAmount = 7;
hovering = false;

fadeInFunc = function(alphaAdd, xAdd) {
	if (drawAlpha < 1) {
		drawAlpha += alphaAdd;
		bookX -= xAdd;
	} else { fadeInDone = true; }
	drawAlpha = clamp(drawAlpha, 0, 1);
	bookX = clamp(bookX, finalXRef, startXRef);
}

fadeOutFunc = function(alphaAdd, xAdd) {
	if (drawAlpha > 0) {
		drawAlpha -= alphaAdd;
		bookX += xAdd;			
	} else {
		instance_destroy(self);
	}
	drawAlpha = clamp(drawAlpha, 0, 1);
	bookX = clamp(bookX, finalXRef, startXRef);
}

scrollingBookUp = function(upWheelAmount = scrollingAmount)
{
	bookY += upWheelAmount;
	bookY = clamp(bookY, -bookBgH, 0);
}	

scrollingBookDown = function(upWheelAmount = scrollingAmount)
{
	bookY -= upWheelAmount;
	bookY = clamp(bookY, -bookBgH / 2, bookBgH);
}






















