spd = -2;
finalSpd = 1;

global.enemyAttackTime = 950;

//BATTLE BOX CHANGING DIMENSIONS
global.borderWidth = 270;
global.borderHeight = 16;
global.boxOriginY = (room_height / 2) + 30;

//SETTING THE XSTART AND YSTART
x = global.boxOriginX + global.borderWidth / 2;
y = (room_height / 2) - 90;

distance = 98;
distanceTravelled = 0;
timerToTurn = 1;
goingLeft = true;
dropTimer = 30;