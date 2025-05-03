event_inherited();

genTimeVars(10, false, 1320, 0);
boxDimensions(240, 140);
playerChangeState(oSoul.stateFree);
setBoxOrigin(room_width / 2, 100);

timer = 1300;
platformCreated = false;
leftSide = global.boxOriginX - (global.borderWidth / 2);
possBlasterXPos = [];
//Push the x positions in the array
for (var i = 1; i < 16; i++)
{
	possBlasterXPos[i - 1] = (leftSide + 16 * i) - 8;
}

var _xx = global.boxOriginX;
var _yy = global.boxOriginY;
var _w = global.borderWidth / 2;
var _h = global.borderHeight / 2;

cannonVertical = instance_create_layer(x, y, "Bullets", oBlasterLineGenerator);
cannonVertical.blasterTimer = 60;
setLineBlasterPos
(
	cannonVertical,
	possBlasterXPos,
	[-70, room_height + 70], 
	possBlasterXPos,
	[_yy - _h - 10, _yy + _h + 10],
	"vertical",
	3
);
cannonHorizontal = instance_create_layer(x, y, "Bullets", oBlasterLineGenerator);
cannonHorizontal.blasterTimer = 60;
setLineBlasterPos
(
	cannonHorizontal,
	[-70, room_width + 70],
	[_yy, _yy + 40, _yy - 40], 
	[20, room_width - 20],
	[_yy, _yy + 40, _yy + 40],
	"horizontal",
	1
);