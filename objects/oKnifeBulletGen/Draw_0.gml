var _extras = 0;

var _tubes = 
[
	//X pos
	[global.border_l, global.border_r, global.border_l, global.border_r],
	//Y pos
	[global.border_d - 20, global.border_d - 40, global.border_d - 60, global.border_d - 80],
];


if (_extras == 4) { exit; }

for (var i = 1; i < 5; i++)
{
	var _rot = 0;
	
	if (i % 2 != 0) { _rot = 270; }
	else _rot = 90;
	draw_sprite_ext(sTubeSteam, 0, _tubes[0][i - 1], _tubes[1][i - 1], 0.5, 0.5, _rot, c_white, 1);
	_extras++;
}
