event_inherited();

genTimeVars(45, false, 1000, 0)
playerChangeState(oSoul.stateFree);
boxDimensions(100, 100);

global.generatorPhase = -1;
//(fa in modo che se nello scorso attacco era ruotata non lo sia più)
oSoul.image_angle = 0;

changeTimer = 150;
index = 0;
teleportTextY = -35;

