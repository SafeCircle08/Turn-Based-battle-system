var _w = 0;
var _h = 0;

var _mirrorH = sprite_get_height(sIlluminationMirror);
var _mirrorW = sprite_get_width(sIlluminationMirror);

for (var i = 0; i < instance_number(oMirror); i++)
{
	_h += _mirrorW / 2;
	_w += _mirrorH + 10 * i;
}

image_xscale = _w;
image_yscale = _h;