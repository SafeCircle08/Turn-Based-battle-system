event_inherited();

global.bulletsCreated = 0;
global.created = false;
global.createTimer = 50;
global.enemyAttackTime = 800;

playerSetState(oSoul.stateFree);

//NUMERO DI TUBI CHE SI VUOLE NEL TURNO
numberOfTubesWidth = 12;
numberOfTubesHeight = 5;

//DIMENSIONI DEL BOX
global.borderWidth = (sprite_get_width(sTubeSteam) * numberOfTubesWidth);
global.borderHeight = (sprite_get_width(sTubeSteam) * numberOfTubesHeight);
width = sprite_get_width(sTubeSteam);
height = sprite_get_height(sTubeSteam);

timerGetCoord = 50;
