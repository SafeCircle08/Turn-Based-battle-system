// Inherit the parent event
event_inherited();
randomize();

timer = setTimer(timer);

if (timer <= 1300) && (timer > 800)
{
	if (global.created == false)
	{
		var _targetsX = [oSoul.x - 400, oSoul.x + 400];
		var _targetsY = [oSoul.y - 400, oSoul.y + 400];
		var _xIndex = irandom_range(0, 1);
		var _yIndex = irandom_range(0, 1);
		createBullets(_targetsX[_xIndex], _targetsY[_yIndex], "Bullets", oCannonFree, 50, 1, false);
	}
}

if (timer <= 800) 
{
	if (timer == 799)
	{
		boxDimensions(200, 125);
		createExclamationMarks();
		createPlatforms(4, 3);
		playerChangeState(oSoul.stateGravity, sUmbrellaEffect);
		global.pov = "Front";
		if (instance_exists(oCannonFree)) 
		{ 
			instance_destroy(oCannonFree); 
			instance_destroy(oCannonAcquiring);
		}
	}
	if (timer % 100 == 0)
	{
		cannonVertical.createBlaster = true;
		cannonHorizontal.createBlaster = true;
	}
}