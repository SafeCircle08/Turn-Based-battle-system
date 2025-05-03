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
function boxDimensions(_width, _height, _resize = false, _instant = true, _wAdder = false, _hAdder = false)
{
	if (_instant == false)
	{
		if (global.borderWidth != _width)
		{
			global.borderWidth += _wAdder;
		}
		
		if (global.borderHeight != _height)
		{
			global.borderHeight += _hAdder;
		}
	}
	else
	{
		global.borderWidth = _width;
		global.borderHeight = _height;				
	}
}

function resizeDeco()
{
	instance_create_layer(global.boxOriginX, global.boxOriginY, "ExtrasObjects", oResizeDeco);
	audio_play_sound(sndResizing, 99, false, global.soundGain);
}

//Set all the time variables of the turn
function genTimeVars(_createTimer, _created, _enemyAttackTime, _bulletsCreated)
{
	global.createTimer = _createTimer;
	global.created = _created;
	global.enemyAttackTime = _enemyAttackTime;
	global.bulletsCreated = _bulletsCreated;
}

//Useful just for saving one line....
function setBoxOrigin(_originX, _originY)
{
	global.boxOriginX = _originX;	
	global.boxOriginY = _originY;
}

//A function that set a certain time and drop it to 0
function setTimer(_timer)
{
	if (_timer > 0)	{ _timer = _timer - 1 }
	return _timer; 
}