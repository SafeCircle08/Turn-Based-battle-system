// Inherit the parent event
event_inherited();

randomize();

var _targetsX = [oSoul.x - 400, oSoul.x + 400]
var _targetsY = [oSoul.y - 400, oSoul.y + 400]

if (global.created == false)
{
	var _xIndex = irandom_range(0, 1);
	var _yIndex = irandom_range(0, 1);
	createBullets
	(
		_targetsX[_xIndex],
		_targetsY[_yIndex],
		"Bullets",
		oCannonFree,
		timers[global.generatorPhase],
		1,
		false
	);	
}
