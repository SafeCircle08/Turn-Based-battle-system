event_inherited();

var _x = room_width / 2;
var _y = room_height / 2;
genTimeVars(60, false, 250, 0);
initializeNewTurn(60, false, 250, 0, 100, 100, _x, _y, oSoul.stateFree);

drawTimer = 50;

tubePositions = 
[
	[117, 132, 147, 162, 177, 192, 207],
	global.border_d - 5,
];