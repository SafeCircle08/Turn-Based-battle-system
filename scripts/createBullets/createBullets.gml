//Creates bullets (easy patterns)
function createBullets(_xx, _yy, _layer, _bullet, _newCreateTimer, _maxBullets, _created)
{
	if (global.createTimer > 0) { global.createTimer-- };
	
	if (global.createTimer == 0)
	{	
		instance_create_layer(_xx, _yy, _layer, _bullet);
		global.bulletsCreated++;
			
		if (global.bulletsCreated == _maxBullets) { global.created = _created; }
		global.createTimer = _newCreateTimer;
	}	
}

//Set the box dimensions
function boxDimensions(_width, _height)
{
	global.borderWidth = _width;
	global.borderHeight = _height;
}

//Set all the time variables of the turn
function genTimeVars(_createTimer, _created, _enemyAttackTime, _bulletsCreated)
{
	global.createTimer = _createTimer;
	global.created = _created;
	global.enemyAttackTime = _enemyAttackTime;
	global.bulletsCreated = _bulletsCreated;
}

//A function that set a certain time and drop it to 0
function setTimer(_timer)
{
	if (_timer > 0)	{ _timer = _timer - 1 }
	return _timer; 
}