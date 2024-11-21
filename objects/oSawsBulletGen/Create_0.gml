event_inherited();

global.bulletsCreated = 0;
global.created = false;
global.createTimer = 100;
global.enemyAttackTime = 9999;

//ORIGINI DEL BOX
global.boxOriginX = 160;
global.boxOriginY = 80;

//DIMENSIONI BOX 
global.borderWidth = 100;
global.borderHeight = 100;

oSoul.state = oSoul.stateGravity;

sawSpeed = undefined;

sawsDown =
[
	//Objects
	[oSaw, oSaw],
	//X positions
	[global.boxOriginX - (global.borderWidth / 2) - 50, global.boxOriginX + (global.borderWidth / 2) + 50],
	//Y positions
	[global.boxOriginY + (global.borderHeight / 2), global.boxOriginY + (global.borderHeight / 2)],
	//X speeds
	[+3, -3],
	//Y speeds
	[0, 0]
];

sawsUp =
[
	//Objects
	[oSaw, oSaw],
	//X positions
	[global.boxOriginX - (global.borderWidth / 2) - 50, global.boxOriginX + (global.borderWidth / 2) + 50],
	//Y positions
	[global.boxOriginY - (global.borderHeight / 2), global.boxOriginY - (global.borderHeight / 2)],
	//X speeds
	[+3, -3],
	//Y speeds
	[0, 0]
];

sawsLeft =
[
	//Objects
	[oSaw, oSaw],
	//X positions
	[global.boxOriginX - (global.borderWidth / 2), global.boxOriginX - (global.borderWidth / 2)],
	//Y positions
	[global.boxOriginY - (global.borderHeight / 2) - 50, global.boxOriginY + (global.borderHeight / 2) + 50],
	//X speeds
	[0, 0],
	//Y speeds
	[+3, -3]
];


sawsRight =
[
	//Objects
	[oSaw, oSaw],
	//X positions
	[global.boxOriginX + (global.borderWidth / 2), global.boxOriginX + (global.borderWidth / 2)],
	//Y positions
	[global.boxOriginY - (global.borderHeight / 2) - 50, global.boxOriginY + (global.borderHeight / 2) + 50],
	//X speeds
	[0, 0],
	//Y speeds
	[+3, -3]
];


sawsArr = [sawsDown, sawsUp, sawsLeft, sawsRight];