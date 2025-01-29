global.bulletATK = 20;
global.generatorPhase = -1;

global.bulletKind = 
[
	//BULLET KIND 0
	[	
		oBullet, //object
		[47, 47],	//x value
		[47, 207], //y value
		noone,
	],
	//BULLET KIND 1
	[
		oBulletSteam,
		[115, 130, 145, 160, 175],
		[155, 155, 155, 155, 155],
		noone,
	],
	//BULLET KIND 2
	[
	oBulletSteamDown,
	[205, 190, 175, 160, 145],
	[60, 60, 60, 60, 60, 60],
	noone,
	],
	//BULLET KIND 3
	[
		[oBulletSteamRight, oBulletSteamLeft, oBulletSteamRight, oBulletSteamLeft],
		[110, 210, 110, 210],
		[70, 90, 110, 130],
		[1, -1, 1, -1],
	],
	//BULLET KIND 4
	[
		oStarBullet,
		[65, 255, 158],
		[110, 110, 25],
		noone,
	],
	//BULLET KIND 5 (DOCUMENT BULLET)
	[
		oDocumentBullet,
		[63, 255],
		[63, 150],
		noone,
	]
];