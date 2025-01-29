event_inherited();

genTimeVars(45, false, 1000, 0)

//Player stats
oSoul.state = oSoul.stateFree;
global.pov = "Up";
global.generatorPhase = -1;
//(fa in modo che se nello scorso attacco era ruotata non lo sia più)
oSoul.image_angle = 0;

//DIMENSIONI DEL BOX
global.borderWidth = 100;
global.borderHeight = 100;

changeTimer = 150;
index = 0;
teleportTextY = -35;

