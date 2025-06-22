x = following.x + xOffset;
y = following.y + yOffset;

if (place_meeting(x, y, toucher))
{
	touchingFunction();
} else { notTouchingFunction(); }