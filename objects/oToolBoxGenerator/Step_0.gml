//CHECKS THE DISTANCE AND SETS THE GRADIENT OF THE SPEED

event_inherited();

global.boxOriginY -= 0.1;

//CHECKS THE DISTANCE AND SETS THE GRADIENT OF THE SPEED

if (distanceTravelled < (distance / 2) - 10) { spd = -2; }
else { spd = -(distanceTravelled / 20); }

if (getAmplitudeTimer > 0) { getAmplitudeTimer-- }

if (getAmplitudeTimer == 0)
{
	amplitude = irandom_range(7, 10);
	getAmplitudeTimer = 50;
}

y = ystart - sin(x / 15) * amplitude;

if (dropTimer > 0) { dropTimer-- }

if (dropTimer == 0)
{
	instance_create_layer(self.x, self.y, "Bullets", oToolBullet);
	dropTimer = irandom_range(10, 40);
}

//QUANDO VA A SINISTRA
if (goingLeft == true)
{
	image_angle += 0.7
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
	image_angle -= 1
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

