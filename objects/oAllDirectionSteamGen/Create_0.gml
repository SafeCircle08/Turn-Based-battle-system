event_inherited();
global.bulletsCreated = 0;
global.created = false;
global.createTimer = 50;
global.enemyAttackTime = 800;

//ORIGINI DEL BOX
global.boxOriginX = 160;
global.boxOriginY = 80;

//NUMERO DI TUBI CHE SI VUOLE NEL TURNO
numberOfTubesWidth = 12;
numberOfTubesHeight = 3;

//DIMENSIONI DEL BOX
global.borderWidth = (sprite_get_width(sTubeSteam) * numberOfTubesWidth);
global.borderHeight = (sprite_get_width(sTubeSteam) * numberOfTubesHeight);
width = sprite_get_width(sTubeSteam);
height = sprite_get_height(sTubeSteam);

timerGetCoord = 30;
