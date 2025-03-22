event_inherited();
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
if (timer_1 < 350) { timer_1 = 0; }

//Creates the stereos
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
		stereoL = instance_create_layer(50, room_height + 100, "Bullets", oStereo);
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
		stereoR = instance_create_layer(room_width - 50, room_height + 100, "Bullets", oStereo);
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
//Creates the bombs
if (timer_2 == -1)
{
	timer_3 = setTimer(timer_3);
	if (timer_3 % 90) == 0
	{
		instance_create_layer(x, y, "Bullets", oBombBullet);	
	}
}

tanVariable += 0.05 * sign(tanVariableSign);
tanVariable = clamp(tanVariable, -5, 5);
global.boxOriginX = global.boxOriginX + arctan(tanVariable) / 2;
if (tanVariable == 5) { tanVariableSign = -1; }
if (tanVariable == -5) { tanVariableSign = 1; }