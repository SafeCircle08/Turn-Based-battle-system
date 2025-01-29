var _xx = global.boxOriginX - (global.borderWidth / 2) + 1
var _yyHigh = global.boxOriginY - (global.borderHeight / 2) + 1
var _yyDown = global.boxOriginY + (global.borderHeight / 2) - 1

var _width = global.borderWidth - 1;
var _height = (global.borderHeight / 2) - 15;

//Draws the 2 pressure plates
draw_sprite_stretched(sPressurePlate_1, 0, _xx, _yyHigh, _width, _height);
draw_sprite_stretched(sPressurePlate_1, 0, _xx, _yyDown -_height, _width, _height + 1);

