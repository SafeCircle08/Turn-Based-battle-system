event_inherited();

instance_create_layer(0,0, LAYER_BULLETS, oDocumentBullet);
oDocumentBullet.canCreateTimer = 85;
genTimeVars(100, false, 9999, 0)
playerSetState(oSoul.stateGravity, sEffectGravity, "Front");
setBoxOrigin(room_width / 2, room_height / 2 - 20);
numberOfWaves = 4;
boxDimensions((sprite_get_width(sWave)*numberOfWaves) - 1, 130);

waveIndex = 0;
waveAlpha = 0;
lavaDropperAlpha = 0;
timer = 50;
yStart = (global.boxOriginY + global.borderHeight / 2) + 50;
oSoul.hbX = 0;
oSoul.hbY = -10;