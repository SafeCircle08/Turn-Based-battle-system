global.createTimer = 0;
global.created = false;
global.bulletsCreated = 0;
global.enemyAttackTime = 300;
global.actualQuestion = -1;
global.pov = "Up";
global.generatorPhase = -1;
global.fxColor = -1;

//Set up variables

//ENEMY TEXT VARIABLES
#region

	#region STEAM PUNK ENEMY
	global.steamEnemyText =
	[
		["So right now you are telling me this is not working???"],
		[
			"This is very annoying... for real ngl",   
			"I'll gain a lot of POWER!",
		],
		[
			"The BOSS will finally understand my importance here!",
			"I'll finally be considered as an INNOVATOR!",
			"FOREVER."
		],
		[
			"And, please...",
			"Don't think that I like doing this to you.",
		],
		["My will is against what i HAVE to do."],
		[
			"So now i have a new font\nuh?\nWell, if this is so,\ni'll make the\ncreator very very HAPPY!",
			"You are just..."
		],
		["Victim of your own fate."],
		["Damn this is starting to get dramatic, isn't it?"],
		[
			"Now let me think of a way in wich i could cheer you up...",
			"...",
			"...",
			"Oh yeah!",
		],
		["I've finally understood PHOTOSINTESIS."],
		[
			"Uh?",
			"You really don't know what it is about?",
		],
		[
			"Ill write that down later...",
			"maybe."
		],
		[
			"Oh my God why are you still fighting?",
			"Won't you just...",
			"... give up...?",
		],
		[
			"I'm starting to get very paranoid,,,,",
			"but at least im not an Android!",
		],
		[
			"sigh...",
			"I think it's time for my final attack.",
			"In which i've worked very hard!",
			"And i'am sure this is going to finally Defeat YOU!"
		],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
		["text"],
	];
	#endregion

	#region	TEMPLATE ENEMY
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
	#endregion

#endregion

//ENEMY PATTERNS GENERATORS
#region
	
	#region	STEAM PUNK PATTERN
	global.steamPunkBulletGenerator = 
	[
		oElectronCircle,
		oRailsKnifeAttack,
		oBallAttack,
		oSpikeUpBulletGen,
		oSpikeDownBulletGen,
		oKnifeBulletGen,
		oDocumentBulletGen,
		oCrossSwordsBulletGen, //5
		oAnswersBulletGen,
		oAnswersBulletGen,
		oAnswersBulletGen,
		oKnifeGenerator,
		oKnifeGenerator_FAST,
		oAllDirectionSteamGen,
		oRobotsToolGen,  //10
		oEmpyTurn, //--------------------
		oChemistryGenerator,
		oSawsBulletGen,
		oSawsBulletGen,
		oPressureElectronGen, //15
		oBlasterFreeGen,
		oStereoGen,
		oBgScrolling,
		oEmpyTurn,
	];
	#endregion
	
	#region TEMPLATE ENEMY PATTERN
	global.otherEnemyBulletGenerator =
	[
		oCrossSwordsBulletGen,
		oPlatformGenerator,
	];
	#endregion
	
#endregion

//FUNCTIONS THAT INITIALIZES THE VARIABLES
#region

	#region	STEAMPUNK INITIALIZE
	function steamPunkEnemyBattleInfo()
	{
		global.monsterHP = 1500;
		global.maxMonsterHp = 1500;
		global.monsterDamage = 1;
		global.enemyTimer = 0;
		global.textList = global.steamEnemyText;
		global.inUseGenerator = global.steamPunkBulletGenerator;
	}
	#endregion
	
	#region TEMPLATE ENEMY INITIALIZE
	function enemyInfo()
	{
		global.monsterHP = 500;
		global.maxMonsterHp = 500;
		global.monsterDamage = 1;
		global.enemyTimer = 0;
		global.textList = global.otherMonsterText;
		global.inUseGenerator = global.otherEnemyBulletGenerator;
	}
	#endregion

#endregion