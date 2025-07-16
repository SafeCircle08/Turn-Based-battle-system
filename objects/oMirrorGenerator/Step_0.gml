var _mirrors = [sIlluminationMirror, sConsciousnessMirror, sPainMirror];
var _mirrorW = sprite_get_width(_mirrors[0]) - 20;
var _mrX = x + 33;
var _mrY = y;

for (var i = 0; i < 3; i++)
{
	var _myMirror = instance_create_layer(_mrX - (_mirrorW * i), _mrY + 20 * i, LAYER_SCOPE, oMirror);
	_myMirror.sprite_index = _mirrors[i];
	_myMirror.frame = 0 + i;
	if (i == 2) { instance_destroy(self); }
}