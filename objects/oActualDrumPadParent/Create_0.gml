//THIS OBJECTS IS USED TO STORE ALL THE GENERAL
//DRUMPAD VARIABLES;
//FOR EACH NEW DRUMPAD, CALL THE FUNCTIONS:
//dpSetVariables() -> to overwrite these variables into the new ones;
//dpFillChamber() -> to fill the actual chamber lol;

//ALL THE VARIABLES INFORMATION CAN BE FOUND 
//IN THOSE SCRIPTS SECTIONS

randomize();
event_inherited();

angle_test = 0;

triggered = false;

angleAdderRef = 100;
angleAdder = angleAdderRef;
delayRef = 100;
delay = delayRef;
angleSpeed = [2, 5, 3, 5];
rotDelay = 90 / angleSpeed[0]; 

angleRound = 0;
image_angle = 0;
image_speed = 0;
animationTimer = 50;
animating = false;
canShoot = false;
actualDamage = 0;
damage = 0;

fact = 3;
leftBarW = -155;
rightBarW = 155;
global.playerAttackTimer = rightBarW * fact;
attackTime = global.playerAttackTimer - 1;
lAdder = leftBarW / attackTime;
rAdder = rightBarW / attackTime;

angles = [-90, 0, 90, 180];
shellNumber = 4;
maxBadShell = 2;
badShellNum = 0;