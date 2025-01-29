event_inherited();

//INIT VARIABLES

genTimeVars(60, false, 850, 0)

//BATTLE BOX CHANGING DIMENSIONS
global.borderWidth = 270;
global.borderHeight = 35;

//ORIGINI DEL BOX
global.boxOriginX = 160;
global.boxOriginY = (room_height / 2) + 40;

//AURA DEL GIOCATORE
oSoul.state = oSoul.stateFree;

// VADO A DESTRA
robotRight = 
[
	oToolBoxGenerator,
	40,
	room_height / 2 - 90,
	[-1.5, +1.5],
	false, //goingLeft
];

//VADO A SINISTRA
robotLeft = 
[
	oToolBoxGenerator,
	room_width - 40,
	room_height / 2 - 90,
	[-1, +1],
	true, //goingLeft
];

robots = [robotLeft, robotRight];
robotSpeeds = noone;