event_inherited();

//instance_create_layer(0,0, "Bullets", oDocumentBullet);
//oDocumentBullet.canCreateTimer = 90;
genTimeVars(100, false, 9999, 0)
numberOfWaves = 4;

boxDimensions((sprite_get_width(sWave)*numberOfWaves) - 1, 200);

global.pov = "Front"; //il player può saltare
waveIndex = 0;
waveAlpha = 0;
lavaDropperAlpha = 0;
timer = 50;
yStart = (global.boxOriginY + global.borderHeight / 2) + 50;

oSoul.state = oSoul.stateGravity;

