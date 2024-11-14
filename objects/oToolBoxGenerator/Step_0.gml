//CHECKS THE DISTANCE AND SETS THE GRADIENT OF THE SPEED

event_inherited();

global.boxOriginY -= 0.1;

if (distanceTravelled < (distance / 2) - 10) { spd = -2; }
else { spd = -(distanceTravelled / 20); }


if (dropTimer > 0) { dropTimer-- }

if (dropTimer == 0)
{
	instance_create_layer(self.x, self.y, layer, oToolBullet);
	dropTimer = irandom_range(10, 40);
}

//QUANDO VA A SINISTRA
if (goingLeft == true)
{
	if (distanceTravelled < distance)
	{
		x += spd;
		distanceTravelled++;
	}
	
	if (distanceTravelled == distance)
	{
		if (timerToTurn > 0) { timerToTurn--; }	
	}
	
	if (timerToTurn == 0)
	{
		goingLeft = false;	
		timerToTurn = 1;
		distanceTravelled = 0;
	}
	exit;
}

//QUANDO VA A DESTRA
if (goingLeft == false)
{
	if (distanceTravelled < distance)
	{
		x -= spd;
		distanceTravelled++;
	}
	
	if (distanceTravelled == distance)
	{
		if (timerToTurn > 0) { timerToTurn--; }	
	}
	
	if (timerToTurn == 0)
	{
		goingLeft = true;	
		timerToTurn = 1;
		distanceTravelled = 0;
	}
}

