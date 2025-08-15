event_inherited();

var playerUpKey = keyboard_check_pressed(ord("W"));
var playerDownKey = keyboard_check_pressed(ord("S"));

getCoordTimer = setTimer(getCoordTimer);

if (getCoordTimer == 0) 
{
	//Cart movement & getting player possible Ys
	var _startX = oSoul.x;
	var _amplitude = 3;
	frame += 1;
	oSoul.x = _startX + cos(frame / 30) * (_amplitude / 10) + oSoul.hsp;
	
	if (array_length(possiblePlayerYpos) < rails_lines)
	{
		for (var i = 0; i < rails_lines; i++)
		{
			var _bU = global.border_u;
			array_push(possiblePlayerYpos, (_bU + i * height) + (height / 2));	
		}
	}
	//Creating the actual rails
	if (instance_number(oRail) < rails_columns * rails_lines)
	{
		createExclamationMarks(+50, -50);
		var _xx = global.border_l; 
		var _yy = global.border_u;
		var _cameraW = camera_get_view_width(view_camera[view_current]);
		for (var i = 0; i < rails_lines; i++)
		{
			for (var j = 0; j < rails_columns; j++)
			{
				instance_create_layer(_cameraW + (j * width), _yy + i * height, LAYER_EXTRAS_OBJECTS, oRail);
			}
		}
	}
}

pressDelay = setTimer(pressDelay);

//Checking if we are clicking before the timer (to have an input buffer)
if (playerDownKey) && (pressDelay < 30 && pressDelay > 0) { clickBeforeDelay = true; inMemKey = 0; }
else if (playerUpKey) && (pressDelay < 30 && pressDelay > 0) { clickBeforeDelay = true; inMemKey = 1; }

//Checking if there is an input into the buffer
if (clickBeforeDelay == true)
{
	if (pressDelay == 0)
	{
		if (inMemKey == 0) { pressingDown(); clickBeforeDelay = false; inMemKey = -1; }
		else { pressingUp(); clickBeforeDelay = false; inMemKey = -1; }
	}
}	
else
{
	//Basic execution of the inputs without the buffer
	if (playerUpKey) && (pressDelay == 0) { pressingUp(); }
	if (playerDownKey) && (pressDelay == 0) { pressingDown(); }
}

//performing the actual slide "animation"
if (sliding == true) 
{
	slideTimer = setTimer(slideTimer);
	if (slideTimer < slideTimerRef - 10) { spriteInput = sPlayerCarting; }
	if (slideTimer != 0) { whileSliding(spriteInput); }
	else 
	{ 
		sliding = false; 
		slideTimer = slideTimerRef;
	}
}

//Puoi anche mettere delle "colate laviche" oltre ai segnali di stop <- (da mettere)

create++;
if (create > 100)
{
	if (create % 15 == 0) 
	{
		createObstacleWall(choose(1, 2));
	}
}