if (drawTimer > 0) { drawTimer-- }

if (drawTimer == 0)
{
	for (var i = 1; i < 8; i++)
	{
		draw_sprite_ext(sTubeSteam, 0, tubePositions[0][i - 1] - 2, tubePositions[1], 0.5, 0.5, 180, c_white, 1);
	}
}