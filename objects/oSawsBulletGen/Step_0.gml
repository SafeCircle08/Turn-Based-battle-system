event_inherited();

#region SAWS ARRAYS (ALL THE KINDS: LEFT, UP...)
var sawsDown =
[
	//Objects
	[oSaw, oSaw],
	//X positions
	[global.boxOriginX - (global.borderWidth / 2) - 100, global.boxOriginX + (global.borderWidth / 2) + 100],
	//Y positions
	[global.boxOriginY + (global.borderHeight / 2) + offSet, global.boxOriginY + (global.borderHeight / 2) + offSet],
	//X speeds
	[+3, -3],
	//Y speeds
	[0, 0]
];

var sawsUp =
[
	//Objects
	[oSaw, oSaw],
	//X positions
	[global.boxOriginX - (global.borderWidth / 2) - 100, global.boxOriginX + (global.borderWidth / 2) + 100],
	//Y positions
	[global.boxOriginY - (global.borderHeight / 2) - offSet, global.boxOriginY - (global.borderHeight / 2) - offSet],
	//X speeds
	[+3, -3],
	//Y speeds
	[0, 0]
];

var sawsLeft =
[
	//Objects
	[oSaw, oSaw],
	//X positions
	[global.boxOriginX - (global.borderWidth / 2) - offSet, global.boxOriginX - (global.borderWidth / 2) - offSet],
	//Y positions
	[global.boxOriginY - (global.borderHeight / 2) - 50, global.boxOriginY + (global.borderHeight / 2) + 50],
	//X speeds
	[0, 0],
	//Y speeds
	[+3, -3]
];

var sawsRight =
[
	//Objects
	[oSaw, oSaw],
	//X positions
	[global.boxOriginX + (global.borderWidth / 2) + offSet, global.boxOriginX + (global.borderWidth / 2) + offSet],
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
	createExclamationMarks();
	//SECOND PHASE OF THE GENERATOR------------------------------
	if (global.generatorPhase == 1) { index = irandom_range(2, 3); }
	else { index = irandom_range(0, 3) }
	
	oSoul.inUseGravity = states[index];
	playerChangeState(global.playerStateGravity, 
	method(self, function() { additionalGravityStateMethod(0); }));
	oSoul.umbrelling = false;
	oSoul.umbrellaJump = false;
	changeStateTimer = 40;
	audio_play_sound(sndExclamation, 50, false, global.soundGain);
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
			instance_create_layer(_sawsArr[index][1][i], _sawsArr[index][2][i], LAYER_BULLETS, _sawsArr[index][0][i]);	
		}
		global.createTimer = timers[global.generatorPhase];
		stateFlow = true;
	}
}