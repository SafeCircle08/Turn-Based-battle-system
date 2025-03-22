if (place_meeting(x, y, oSupportPlayerHitBox_2)) 
{ 
	oRectangleIndicator.weight++;
	if (oSoul.y > global.boxOriginY)
	{ 
		oRectangleIndicator.index = 0; 
	} else { oRectangleIndicator.index = 1; }
} 
