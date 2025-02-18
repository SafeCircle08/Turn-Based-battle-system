event_inherited();

//COORDINATE DEI QUADRATI ANSWERS
var _leftAnswerX = global.boxOriginX - (global.borderWidth) / 4;
var _rightAnswerX = global.boxOriginX + (global.borderWidth) / 4;
var _upAnswerY = global.boxOriginY - (global.borderHeight) / 4;
var _downAnswerY = global.boxOriginY + (global.borderHeight) / 4;

//COORDINATE GENERICHE PER FAR SPAWNARE LO STEAM
var _steamX =  global.boxOriginX;
var _steamY = global.boxOriginY;

//ARRAY CHE CONTIENE LE INFORMAZIONI DELLE ANSWERS
var _answersPos =
[
	[oAnswerA, oAnswerB, oAnswerC, oAnswerD], //Objects
	[_leftAnswerX, _rightAnswerX, _leftAnswerX, _rightAnswerX], //The x coord
	[_upAnswerY, _upAnswerY, _downAnswerY, _downAnswerY], //The y coord
];

//ARRAY CHE CONTIENE LE INFORMAZIONI DEGLI STEAM
var _steamAttacks =
[
	[
		[oBulletSteamDown, oBulletSteam],
		[oBulletSteam, oBulletSteam],
	],
	[
		[_steamX, _steamX],
		[_steamX - 20, _steamX + 20],
	],
	[
		[_steamY - 50, _steamY + 50],
		[_steamY + 50, _steamY + 50]
	]
];

//PARTE DOVE VA A CREARE TUTTE LE ANSWERS
if (global.created == false)
{	
	for (var i = 0; i < 4; i++)
	{
		instance_create_layer(_answersPos[1][i], _answersPos[2][i], "Bullets", _answersPos[0][i]);
		if (i == 3) { global.bulletsCreated = 1 }
	}
	if (global.bulletsCreated == 1) { global.created = true; global.actualQuestion++ };	
}

global.rightAnswer = global.answers[global.actualQuestion];

//CONTROLLA SE IL PLAYER HA RISPOSTO O MENO
if (global.enemyTimer > 997) && (answered == false)
{
	global.playerHP -= 2;
	if (instance_exists(oAnswerParent)) { instance_destroy(oAnswerParent) };
}

//PARTE DOVE VA A CREARE GLI STEAM
steamTimer = setTimer(steamTimer);

if (steamTimer == 0)
{
	for (var i = 0; i < 2; i++)
	{
		instance_create_layer(_steamAttacks[1][steamAttackindex][i], _steamAttacks[2][steamAttackindex][i], "Bullets", _steamAttacks[0][steamAttackindex][i]);	
		steamTimer = 100;
	}
	steamAttackindex++;
	if (steamAttackindex > 1) { steamAttackindex = 0; }
}