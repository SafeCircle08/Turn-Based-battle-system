if (self.visible = false) 
{
	animateBoxTimer = 30; 
	currentWidth = 50;
	currentHeight = 50;
} 
else 
{ 
	if (animateBoxTimer > 0 ) { animateBoxTimer-- } 
}

if (animateBoxTimer == 0)
{
	if (currentWidth < global.borderWidth)
	{
		currentWidth += ((global.borderWidth - currentWidth) / 2);
	}	

	if (currentWidth > global.borderWidth)
	{
		currentWidth -= ((currentWidth - global.borderWidth) / 2);
	}	

	if (currentHeight < global.borderHeight)
	{
		currentHeight += ((global.borderHeight - currentHeight) / 2);
	}	

	if (currentHeight > global.borderHeight)
	{
		currentHeight -= ((currentHeight - global.borderHeight) / 2);
	}
}