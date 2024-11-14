event_inherited();

global.bulletsCreated = 0;
global.created = false;
global.createTimer = 100;
global.enemyAttackTime = 900;

//ORIGINI DEL BOX
global.boxOriginX = 160;
global.boxOriginY = 80;
global.pov = "Front"; //il player può saltare

numberOfWaves = 4;
waveIndex = 0;
waveAlpha = 0;
lavaDropperAlpha = 0;
timer = 50;
yStart = (global.boxOriginY + global.borderHeight / 2) + 50;
//DIMENSIONI DEL BOX
global.borderHeight = 130;
global.borderWidth = (sprite_get_width(sWave)*numberOfWaves);

oSoul.state = oSoul.stateGravity;


