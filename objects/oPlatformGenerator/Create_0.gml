event_inherited();

instance_create_layer(0,0, "Bullets", oDocumentBullet);
oDocumentBullet.canCreateTimer = 75;
genTimeVars(100, false, 800, 0)
playerChangeState(oSoul.stateGravity, sEffectGravity, "Front");
setBoxOrigin(room_width / 2, room_height / 2 - 20);
numberOfWaves = 4;
boxDimensions((sprite_get_width(sWave)*numberOfWaves) - 1, 130);

instance_create_layer(0,0, "Bullets", oDocumentBullet);
oDocumentBullet.canCreateTimer = 75;

waveIndex = 0;
waveAlpha = 0;
lavaDropperAlpha = 0;
timer = 50;
yStart = (global.boxOriginY + global.borderHeight / 2) + 50;
oSoul.hbX = 0;
oSoul.hbY = -10;