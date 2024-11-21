event_inherited();

instance_create_layer(0,0, "Bullets", oDocumentBullet);
oDocumentBullet.canCreateTimer = 70;

global.bulletsCreated = 0;
global.created = false;
global.createTimer = 100;
global.enemyAttackTime = 900;

//ORIGINI DEL BOX
global.boxOriginX = 160;
global.boxOriginY = 80;
global.pov = "Front"; //il player può saltare
//DIMENSIONI DEL BOX
numberOfWaves = 4;
global.borderHeight = 130;
global.borderWidth = (sprite_get_width(sWave)*numberOfWaves) - 1;

waveIndex = 0;
waveAlpha = 0;
lavaDropperAlpha = 0;
timer = 50;
yStart = (global.boxOriginY + global.borderHeight / 2) + 50;

oSoul.state = oSoul.stateGravity;


