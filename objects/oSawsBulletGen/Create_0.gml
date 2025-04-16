event_inherited();

timers = [70, 55];
global.generatorPhase++;
genTimeVars(timers[global.generatorPhase], false, 1200, 0)
playerChangeState(oSoul.stateGravityUp);
boxDimensions(100, 100);
global.pov = "Front";

//Mette il cuore al centro
global.yOffset = 0;

frame = 0
gravUp = oSoul.stateGravityUp;
gravDown = oSoul.stateGravity;
gravLeft = oSoul.stateGravityLeft;
gravRight = oSoul.stateGravityRight;


sawSpeed = undefined;
sawSpeedX = undefined;
sawSpeedY = undefined;
changeStateTimer = 40;
states = [gravDown, gravUp, gravLeft, gravRight]
index = undefined;
stateFlow = true;

if (global.generatorPhase == 1)
{
	gloveDir = -1;
	sinMark = 1;
	instance_create_layer(global.boxOriginX - 100, y, "Bullets", oFunkyGlove);
	gloveDir = 1;
	sinMark = -1;
	instance_create_layer(global.boxOriginX + 100, y, "Bullets", oFunkyGlove);
}
#region SAWS ARRAYS (ALL THE KINDS: LEFT, UP...)

sawsDown =
[
	//Objects
	[oSaw, oSaw],
	//X positions
	[global.boxOriginX - (global.borderWidth / 2) - 100, global.boxOriginX + (global.borderWidth / 2) + 100],
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
	[global.boxOriginX - (global.borderWidth / 2) - 100, global.boxOriginX + (global.borderWidth / 2) + 100],
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

#endregion