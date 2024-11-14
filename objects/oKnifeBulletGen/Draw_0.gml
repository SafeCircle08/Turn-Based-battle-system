var _extras = 0;

if (_extras == 4) { exit; }

for (var i = 1; i < 5; i++)
{
	var _rot = 0;
	
	if (i % 2 != 0) { _rot = 270; }
	else _rot = 90;
	draw_sprite_ext(sTubeSteam, 0, global.bulletKind[3][1][i - 1], global.bulletKind[3][2][i - 1], 0.5, 0.5, _rot, c_white, 1);
	_extras++;
}
