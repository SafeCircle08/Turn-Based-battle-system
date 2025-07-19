event_inherited();

#region FINAL SECTION
if (finalSection = true)
{
	//Preparing forr the last section;
	if (timer_3 = -1)
	{
		audio_stop_all();
		setBoxOrigin(room_width / 2, room_height / 2 + 25);
		boxDimensions(100, 100);
		playerSetState(oSoul.stateFree);
		oSoul.canMove = false;
		oSoul.x = global.boxOriginX;
		oSoul.y = global.boxOriginY;
		instance_destroy(oBackGround);
		instance_destroy(oDocumentWave);
		instance_destroy(oBulletParent);
		instance_destroy(electroLUp);
		instance_destroy(electroLDown);
		instance_destroy(electroRUp);
		instance_destroy(electroRDown);
		layer_sequence_destroy(global.enemySeq);
		instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oBoxDestroyer);
		instance_destroy(blaster_down);
		timer_3 = -2;
	}
	exit;
}
#endregion
#region TIMER 1 (ULTIMATE BLASTER COMBO)
timer_1 = setTimer(timer_1);
timerIndex = clamp(timerIndex, 0, array_length(timerSpecial) - 1);

//Spams the blasters
if (timer_1 == timerSpecial[timerIndex])
{
	if (instance_exists(cannonHorizontal))
	{
		cannonHorizontal.createBlaster = true;
		timerIndex += 1;
		createExclamationMarks(-50, 50, 450, -450)
	}
}

if (timer_1 == 900)
{
	electroLUp = instance_create_layer(x, y, LAYER_BULLETS, oElectricity);
	electroLUp.distanceX = -(global.borderWidth / 2) + 10;
	electroLUp.distanceY = -72;

	electroLDown = instance_create_layer(x, y, LAYER_BULLETS, oElectricity);
	electroLDown.distanceX = -(global.borderWidth / 2) + 10;
	electroLDown.distanceY = +72;

	electroRUp = instance_create_layer(x, y, LAYER_BULLETS, oElectricity);
	electroRUp.distanceX = (global.borderWidth / 2) - 10;
	electroRUp.distanceY = -72;
	electroRUp.image_xscale = -1;

	electroRDown = instance_create_layer(x, y, LAYER_BULLETS, oElectricity);
	electroRDown.distanceX = (global.borderWidth / 2) - 10;
	electroRDown.distanceY = +72;
	electroRDown.image_xscale = -1;		
}

if (timer_1 < 350) { timer_1 = 0; }
#endregion
#region TIMER 2 (CREATES the STEREOS)
if (timer_1 == 0)
{
	if (timer_2 == 695) { resizeDeco(); }
	boxDimensions(200, 100, true, false, 0.2, -0.1);
	electroLUp.distanceX = -(global.borderWidth / 2) + 10;
	electroLDown.distanceX = -(global.borderWidth / 2) + 10;
	electroRUp.distanceX = (global.borderWidth / 2) - 10;
	electroRDown.distanceX = (global.borderWidth / 2) - 10;
	
	timer_2 = setTimer(timer_2);
	if (timer_2 % 100) == 0
	{
		stereoL = instance_create_layer(50, room_height + 100, LAYER_BULLETS, oStereo);
		stereoL.image_xscale = 1;
		stereoL.angles = [0, 30, 0, -30];
		stereoL.frameSign = -1;
		stereoL.xAdder = 10;
		stereoL.yAdder = 0;
		with (stereoL)
		{
			stereoStepEvent = function()
			{
				y -= 5;
				createNotes();
				if (y < - 30) { instance_destroy(self); }
			}
		}
	}
	if (timer_2 % 175) == 0
	{
		stereoR = instance_create_layer(room_width - 50, room_height + 100, LAYER_BULLETS, oStereo);
		stereoR.image_xscale = -1;
		stereoR.angles = [180, 210, 180, 150];
		stereoR.frameSign = -1;
		stereoR.xAdder = 10;
		stereoR.yAdder = 0;
		with (stereoR)
		{
			stereoStepEvent = function()
			{
				y -= 5;
				createNotes();
				if (y < - 30) { instance_destroy(self); }
			}
		}
	}
	if (timer_2 == 0) { timer_2 = -1; timer_1 = -1;}
}
#endregion
#region TIMER 3 (CREATES THE BOMB AND THE FINAL BLASTERS)
//Creates the bombs & the final blaster
if (timer_2 == -1)
{
	timer_3 = setTimer(timer_3);
	if (timer_3 % 90) == 0
	{
		instance_create_layer(x, y, LAYER_BULLETS, oBombBullet);
	}
	if (timer_3 % 150 == 0) 
	{
		if (instance_exists(blaster_down)) { instance_destroy(blaster_down); }
		blaster_down = instance_create_layer(x, y, LAYER_BULLETS, oBlasterLineGenerator);
		blaster_down.specific = false;
		setLineBlasterPos
		(
			blaster_down,
			[global.boxOriginX - 20, global.boxOriginX + 20],
			[room_height + 20, room_height + 20],
			[global.boxOriginX - 20, global.boxOriginX + 20],
			[200, 200],
			"vertical",
			1
		);	
		blaster_down.createBlaster = true;		
	}
	if (timer_3 == 0) 
	{ 
		timer_1 = -1;
		timer_2 = -2;
		timer_3 = -1;
		finalSection = true; 
	}
}
#endregion


tanVariable += 0.05 * sign(tanVariableSign);
tanVariable = clamp(tanVariable, -5, 5);
global.boxOriginX = global.boxOriginX + arctan(tanVariable) / 2;
if (tanVariable == 5) { tanVariableSign = -1; }
if (tanVariable == -5) { tanVariableSign = 1; }