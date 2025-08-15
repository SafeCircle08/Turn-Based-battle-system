event_inherited();

timers = [70, 55];
global.generatorPhase++;
var _x = room_width / 2;
var _y = room_height / 2;
initializeNewTurn(timers[global.generatorPhase], false, 800, 0, 100, 100, _x, _y, oSoul.stateGravity);

//Mette il cuore al centro
global.yOffset = 0;

frame = 0;

sawSpeed = undefined;
sawSpeedX = undefined;
sawSpeedY = undefined;
changeStateTimer = 40;
states = [global.playerJumpStateMoveInfo.gravityBasic, global.playerJumpStateMoveInfo.gravityUp, global.playerJumpStateMoveInfo.gravityLeft, global.playerJumpStateMoveInfo.gravityRight];
index = undefined;
stateFlow = true;

if (global.generatorPhase == 1)
{
	gloveDir = -1;
	sinMark = 1;
	instance_create_layer(global.boxOriginX - 100, y, LAYER_BULLETS, oFunkyGlove);
	gloveDir = 1;
	sinMark = -1;
	instance_create_layer(global.boxOriginX + 100, y, LAYER_BULLETS, oFunkyGlove);
}
offSet = 10;