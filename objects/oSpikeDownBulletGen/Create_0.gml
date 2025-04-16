event_inherited(); //global.playerMoveTimer = 65;

genTimeVars(60, false, 600, 0)
playerChangeState(oSoul.stateFree);

//DIMENSIONI BOX 
global.borderWidth = 100;
global.borderHeight = 100;

drawTimer = 50;
slowSteamTimer = 75;

tubePositions = 
[
	[117, 132, 147, 162, 177, 192, 207],
	global.border_u - 9,
];