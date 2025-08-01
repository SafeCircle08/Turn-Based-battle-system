/*

	Just a voodo enemy
	(a base for other enemies to follow)

*/

global.otherMonsterText = [
	[
		"Hello!",
		"This is a test text!",
		"Just to see if the globals vars are working properly!"
	],
	[
		"Oh my God!",
		"It works!!!!"
	]
];

global.otherEnemyBulletGenerator =
[
	oCrossSwordsBulletGen,
	oPlatformGenerator,
];

	
//FUNCTIONS THAT INITIALIZES THE VARIABLES

function enemyInfo()
{
	global.monsterHP = 500;
	global.maxMonsterHp = 500;
	global.monsterDamage = 1;
	global.enemyTimer = 0;
	global.textList = global.otherMonsterText;
	global.inUseGenerator = global.otherEnemyBulletGenerator;
}