//Dialogue list
global.steamEnemyText =
[
	[
	 "AAAnnnnd, I have\nchanged my Font again...\nIs this better???\nPLEASE! You have to\ntell me!\nTwT",
	 "Loading packages...",
	 "std::cout <<\n 'FINALLY' \n<< std::endl;",
	 "I've finally obtained\n a voice!",
	 "And you know,\n I've invented \n  much everything here;\n I think a little\n  gift won't hurt me!",
	 "You can't understand\n for how long I've\n  waited for this\nmoment!",
	 "I should probably call\n my BOSS, my Robots,\n  my-",
	 "You know what?",
	 "Let's not tell\n anything to BOSS",
	 "He'd probably\n starts a business\n  on ts",
	 "&&",
	 "I hate\n my boss!\n  => (LOL)",
	],
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

//Generator list
global.steamPunkBulletGenerator = 
[
	oEmpyTurn,
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

//Initialize function
function steamPunkEnemyBattleInfo()
{
	global.monsterHP = 1500;
	global.maxMonsterHp = 1500;
	global.monsterDamage = 1;
	global.enemyTimer = 0;
	global.textList = global.steamEnemyText;
	global.inUseGenerator = global.steamPunkBulletGenerator;
}