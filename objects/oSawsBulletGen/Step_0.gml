event_inherited();

if keyboard_check(ord("X")) oSoul.state = oSoul.stateGravity;
if keyboard_check(ord("Z")) oSoul.state = oSoul.stateGravityUp;
if keyboard_check(ord("C")) oSoul.state = oSoul.stateGravityRight;
if keyboard_check(ord("V")) oSoul.state = oSoul.stateGravityLeft;

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

if (global.generatorPhase == 1)
{
	frame += 0.01
	global.boxOriginY = (sin(frame) * 40) + 110;
}


if (stateFlow == true)
{
	if (changeStateTimer > 0) { changeStateTimer-- }
}

//Cambia l'aura del player (destra, sinistra ecc...)
if (changeStateTimer == 0)
{
	/*
	for (var i = 0; i < 4; i++)
	{
		var _xL = global.boxOriginX - (global.borderWidth / 2);
		var _xR = global.boxOriginX + (global.borderWidth / 2);
		var _yU = global.boxOriginY - (global.borderHeight / 2);
		var _yD = global.boxOriginY + (global.borderHeight / 2);
		var _xPos = [_xL + 10, _xR - 10, _xL + 10, _xR - 10];
		var _yPos =[_yU + 10, _yU + 10, _yD - 10, _yD - 10];
		instance_create_layer(_xPos[i], _yPos[i], "Bullets", oExclamationMark)
	}
	*/
	createExclamationMarks();
	//SECOND PHASE OF THE GENERATOR------------------------------
	if (global.generatorPhase == 1) { index = irandom_range(2, 3); }
	else { index = irandom_range(0, 3) }
	
	oSoul.state = states[index];
	changeStateTimer = 40;
	audio_play_sound(sndExclamation, 50, false);
	stateFlow = false;
}

//Crea le seghe circolari
if (global.createTimer > 0) { global.createTimer-- }

if (global.created == false)
{
	if (global.createTimer == 0)
	{  
		var _sawsArr = [sawsDown, sawsUp, sawsLeft, sawsRight];  
		for (var i = 0; i < 2; i++)
		{
			sawSpeedX = _sawsArr[index][3][i];
			sawSpeedY = _sawsArr[index][4][i];
			instance_create_layer(_sawsArr[index][1][i], _sawsArr[index][2][i], "Bullets", _sawsArr[index][0][i]);	
		}
		global.createTimer = timers[global.generatorPhase];
		stateFlow = true;
	}
}