event_inherited();

setBoxOrigin(room_width / 2, room_width / 2 - 50);
boxDimensions(170, 100);
genTimeVars(0, false, 750, 0);
playerChangeState(oSoul.stateFree, sNoEffects);
frame = 0;
delayTimer = 10;
delayTimer_2 = 70;
maxElectrons = 12;
angleMultiplier = 360 / maxElectrons;
electronN = 0;
timer = 0;