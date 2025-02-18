indexX = -1;
indexY = -1;

height = sprite_get_height(sCannon) / 2;

yyUp = global.boxOriginY - (global.borderHeight/ 2) + height + 10;
yyDown = global.boxOriginY + (global.borderHeight / 2) - height - 10;

createBlaster = false;
index = undefined;