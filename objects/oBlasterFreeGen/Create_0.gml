event_inherited();

global.generatorPhase++;
timers = [40, 70];
genTimeVars(timers[global.generatorPhase], false, 9000, 0);
boxDimensions(250, 140);

global.pov = "Up";

oSoul.state = oSoul.stateFree;