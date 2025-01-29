global.createTimer = 0;
global.created = false;
global.bulletsCreated = 0;
global.enemyAttackTime = 300;
global.actualQuestion = -1;
global.pov = "Up";
global.generatorPhase = -1;
global.fxColor = -1;

global.bulletsGenerators = 
[
	oParticleBulletGen,
	oSpikeUpBulletGen,
	oSpikeDownBulletGen,
	oKnifeBulletGen,
	oDocumentBulletGen,
	oCrossSwordsBulletGen, //5
	oAnswersBulletGen,
	oAnswersBulletGen,
	oAnswersBulletGen,
	oAllDirectionSteamGen,
	oRobotsToolGen,  //10
	oPlatformGenerator,
	oChemistryGenerator,
	oSawsBulletGen,
	oSawsBulletGen,
	oTeleportBulletGen, // 15
	oPressureElectronGen,
	oBlasterFreeGen,
];