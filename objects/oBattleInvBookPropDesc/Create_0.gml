description = "";
bgW = 0;
detSprite = 0;
startY = 0;
goalY = 40;
descBgY = -50;
drawAlpha = 0;

fadingDone = false;
fadingOut = false;

fadeInFunc = function(alphaAdd, xAdd) {
	if (drawAlpha < 1) {
		drawAlpha += alphaAdd;
		descBgY += xAdd;
	} else { fadingDone = true; }
	drawAlpha = clamp(drawAlpha, 0, 1);
	descBgY = clamp(descBgY, -50, 50);
}

fadeOutFunc = function(alphaAdd, xAdd) {
	if (drawAlpha > 0) {
		drawAlpha -= alphaAdd;
		descBgY -= xAdd;			
	} else {
		instance_destroy(self);
	}
	drawAlpha = clamp(drawAlpha, 0, 1);
	descBgY = clamp(descBgY, -50, 50);
}