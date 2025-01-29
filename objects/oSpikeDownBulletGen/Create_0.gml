event_inherited(); //global.playerMoveTimer = 65;

genTimeVars(60, false, 600, 0)

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
//Setta lo state in cui si trova il player
oSoul.state = oSoul.stateFree;