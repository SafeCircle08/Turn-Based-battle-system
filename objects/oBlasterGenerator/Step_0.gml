randomize();


var _height = (sprite_get_height(sCannon) / 2);

var _xStart = -200;
var _yStart = [yyUp, yyDown];

if (createBlaster == true)
{
	//0 creates the upper blaster, 1 creates the lower blaster
	if (oSoul.y > global.boxOriginY) { index = 1; } else { index = 0; }
	instance_create_layer(_xStart, _yStart[index], "Instances", oCannonLine);
	createBlaster = false;
	oRectangleIndicator.weight = 0;
}