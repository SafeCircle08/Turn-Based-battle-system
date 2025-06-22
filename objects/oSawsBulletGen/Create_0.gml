event_inherited();

timers = [70, 55];
global.generatorPhase++;
genTimeVars(timers[global.generatorPhase], false, 800, 0)
playerChangeState(oSoul.stateGravityUp, sEffectGravity);
boxDimensions(100, 100);

//Mette il cuore al centro
global.yOffset = 0;

frame = 0;
gravUp = oSoul.stateGravityUp;
gravDown = oSoul.stateGravity;
gravLeft = oSoul.stateGravityLeft;
gravRight = oSoul.stateGravityRight;

sawSpeed = undefined;
sawSpeedX = undefined;
sawSpeedY = undefined;
changeStateTimer = 40;
states = [gravDown, gravUp, gravLeft, gravRight];
index = undefined;
stateFlow = true;

if (global.generatorPhase == 1)
{
	gloveDir = -1;
	sinMark = 1;
	instance_create_layer(global.boxOriginX - 100, y, "Bullets", oFunkyGlove);
	gloveDir = 1;
	sinMark = -1;
	instance_create_layer(global.boxOriginX + 100, y, "Bullets", oFunkyGlove);
}
offSet = 10;