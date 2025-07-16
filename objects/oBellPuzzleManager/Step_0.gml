with (oPlayerOW)
{
	var _bellButton = instance_position(x, y, oBellButton);
	var _resetButton = instance_position(x, y, oResetButton);
	var _playSoundButton = instance_position(x, y, oPlaySoundButton);
	
	if (keyboard_check_pressed(vk_enter)) && (other.performing == false)
	{
		//The sounds
		if (place_meeting(x, y, _bellButton))
		{
			//Put the choosen var into our solution array
			other.input(_bellButton.actualSound, _bellButton);
		}
		//Reset inputs
		if (place_meeting(x, y, oResetButton))
		{
			other.resetInputs();
		}
		//Check the sounds
		if (place_meeting(x, y, oPlaySoundButton))
		{
			other.checkingSound = true;
		}
	}
}

//Play correct sound sequence
if (checkingSound) { hearCorrectSolSounds(); }


//Final step: check if right or wrong solution
if (array_length(playerSolution) == 3)
{
	var correctN = 0;
	for (var i = 0; i < 3; i++)
	{
		if (playerSolution[i] == correctSolution[i])
		{
			correctN++;
		}
	}
	if (correctN == 3)
	{
		hearCorrectSolSounds(true);
		exit;
	}
	wrongSolution();
}	