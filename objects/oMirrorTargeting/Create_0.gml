var _w = 0;
var _h = 0;

var _mirrorH = sprite_get_height(sIlluminationMirror);
var _mirrorW = sprite_get_width(sIlluminationMirror);

for (var i = 0; i < instance_number(oMirror); i++)
{
	_h += _mirrorH / 2;
	_w += _mirrorW + 10 * i;
}

image_xscale = 2;
image_yscale = 2;