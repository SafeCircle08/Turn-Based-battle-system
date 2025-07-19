x = following.x + xOffset;
y = following.y + yOffset;

if (place_meeting(x, y, oSoul))
{
	touchingFunction();
} else { notTouchingFunction(); }

