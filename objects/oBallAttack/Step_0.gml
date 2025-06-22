event_inherited();

frame++;
if (frame == 100)
{
	createExclamationMarks();
	createElectron(-10, global.boxOriginY, 3, 3, 1, 1, -4, 2, 0.08);
}

if (frame == 250)
{
	boxDimensions(220, 150);
	createExclamationMarks();
	createProton(room_width + 10, global.boxOriginY, 3, 3, 1, 1, 50, -3, -2, 0.08);
}