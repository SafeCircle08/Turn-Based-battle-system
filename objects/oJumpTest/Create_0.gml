event_inherited();

genTimeVars(100, false, 99999, 0)
//ORIGINI DEL BOX
global.boxOriginX = 160;
global.boxOriginY = 80;
global.pov = "Front"; //il player può saltare
//DIMENSIONI DEL BOX
numberOfWaves = 4;
boxDimensions(100, (sprite_get_width(sWave)*numberOfWaves) - 1);

waveIndex = 0;
waveAlpha = 0;
lavaDropperAlpha = 0;
timer = 50;
yStart = (global.boxOriginY + global.borderHeight / 2) + 50;

oSoul.state = oSoul.stateGravity;

