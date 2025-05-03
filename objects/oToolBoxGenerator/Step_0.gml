//CHECKS THE DISTANCE AND SETS THE GRADIENT OF THE SPEED
event_inherited();
randomize();

global.boxOriginY -= 0.05;

y = ystart - sin(x / 15) * amplitude;

if (dropTimer > -100) { dropTimer-- }

//QUANDO E' ZERO PARTE L'ANIMAZIONE
if (dropTimer == 0)
{
	sprite_index = sRobotLaunching
}

//LANCIA L'OGGETTO
if (dropTimer == -45)
{
	instance_create_layer(self.x, self.y, "ExtrasObjects", oExclamationMark);
	instance_create_layer(self.x, self.y, "Bullets", oToolBullet);	
}

//INTERROMPE L'ANIMAZIONE
if (dropTimer == -60) 
{
	dropTimer = irandom_range(5, 20);
	sprite_index = sRobotStill;		
}

//QUANDO VA A DESTRA
if (goingLeft == false)
{
	//FARE RIFERIMENTO ALL'ARRAY
	//DI oRobotsBulletgen
	x += spds[1];
	
	//Controlla prima che tutto lo sprite vada fuori dallo schermo
	if (x + xBuffer > room_width) { if (timerToTurn > 0) timerToTurn--; }
	
	if (timerToTurn == 0)
	{
		goingLeft = true;	
		timerToTurn = 1;	
	}
	exit;
}

//QUANDO VA A SINISTRA
if (goingLeft == true)
{
	//FARE RIFERIMENTO ALL'ARRAY
	//DI oRobotsBulletgen
	x += spds[0];
	
	//Controlla prima che tutto lo sprite vada fuori dallo schermo
	if (x - xBuffer - 5 < 0) { if (timerToTurn > 0) timerToTurn--; }	
	
	if (timerToTurn == 0)
	{
		goingLeft = false;	
		timerToTurn = 1;
	}
}