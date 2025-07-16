playerYellowPop();

draw_set_color(c_white);
if (reduceAlphaTimer % 15 == 0) && (reduceAlphaTimer != 0)
{
	draw_rectangle(refX - 10, refY, refX + 10, refY + 1, true)
	//draw_line(refX- 10, refY, refX + 12, refY);
}
draw_set_color(c_black);