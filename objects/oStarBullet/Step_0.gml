if (timerGetVisible > 0) timerGetVisible--;

if (timerGetVisible == 0)
{
	visible = true;
	move_towards_point(oSoul.x, oSoul.y, 0.3);	
}