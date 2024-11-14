event_inherited();
global.createTimer = 120;
global.created = false;
global.bulletsCreated = 0;
global.enemyAttackTime = 360;

//ORIGINI DEL BOX
global.boxOriginX = 160;
global.boxOriginY = 75;

//DIMENSIONI BOX 
global.borderWidth = 100;
global.borderHeight = 100;

drawTimer = 50;

tubePositions = 
[
	[117, 132, 147, 162, 177, 192, 207],
	global.border_d + 10,
];

oSoul.state = oSoul.stateFree;