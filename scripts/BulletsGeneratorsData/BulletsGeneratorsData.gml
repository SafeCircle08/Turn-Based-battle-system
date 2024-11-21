global.createTimer = 0;
global.created = false;
global.bulletsCreated = 0;
global.enemyAttackTime = 300;
global.actualQuestion = -1;
global.pov = "Up";

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
	oToolBoxGenerator,  //10
	oPlatformGenerator,
	oChemistryGenerator,
	oExplosionsBulletGen,
	oSawsBulletGen,
];