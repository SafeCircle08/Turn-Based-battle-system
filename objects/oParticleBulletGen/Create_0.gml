event_inherited();

genTimeVars(120, false, 400, 0);
playerChangeState(oSoul.stateMirrored, sInvertedEffect, "Up");

//DIMENSIONI DEL BOX
global.borderHeight = 100;
global.borderWidth = 100;

oSoul.state = oSoul.stateMirrored;
