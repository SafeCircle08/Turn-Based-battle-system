//FARE RIFERIMENTO AL oRobotsToolgen;
//PER ROBOT LEFT: C'E' UN ARRAY CHE DICE
//SE IL ROBOT STA ANDANDO A SINISTRA APPENA CREATO (0 o 1)
//PER ROBOTS SPEEDS: ANCHE QUI C'E' UN ARRAY CHE CONTIENE
//LE VARIABILI DELLA VELOCITA' (NON SONO GIUSTE A LIVELLO SCRITTO)
//MA FUNZIONANO PER VIA DI COME E' SCRITTO IL CODICE DEL ROBOTTINO CHE SI MUOVE
goingLeft = oRobotsToolGen.robotLeft;
spds = oRobotsToolGen.robotSpeeds;
timerToTurn = 1;
amplitude = 1;
getAmplitudeTimer = 50;

xBuffer = sprite_get_width(sprite_index) / 4

image_xscale = 0.5;
image_yscale = 0.5;

distance = 98;
distanceTravelled = 0;
timerToTurn = 1;
dropTimer = 30;
maxDropTimer = 30