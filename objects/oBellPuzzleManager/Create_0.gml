correctSolution = [sndAllert_1, sndBallBounce, sndBulletPopping]; //array of sounds values
playerSolution = []; //an array that contains the inputs of the player
numberOfSounds = 3; //for a max of 5
glassWallInstanceRef = 0;

soundDelayRef = 50;
soundDelay = soundDelayRef;
actualSound = 0;
checkingSound = false;
shatterWallTimer = 300;

performing = false;

correctSolutionCheck = function()
{
	shatterWallTimer = setTimer(shatterWallTimer);
	if (shatterWallTimer == 0)
	{
		glassWallInstanceRef.createShards();
		instance_destroy(self);
	}
}

//You press play sounds button
hearCorrectSolSounds = function(goesToSolution = false)
{
	performing = true;
	//Play the sounds
	soundDelay = setTimer(soundDelay);
	if ((soundDelay == 0) && (actualSound != 3))
	{
		audio_play_sound(correctSolution[actualSound], 50, false, 1, 2);
		soundDelay = soundDelayRef;
		actualSound++;
	} 
	
	//All sounds played
	if (actualSound == 3)
	{
		if (goesToSolution == false)
		{
			//Reset the function
			checkingSound = false;
			soundDelay = soundDelayRef;
			actualSound = 0;
			performing = false;
		}
		else { correctSolutionCheck(); }		
	}
}


//When you choose on bell button
input = function(soundIndex, collider)
{
	performing = true;
	
	//Player cant move
	oPlayerOW.canMove = false; //gets reset in soundWave obj
	
	//Creates the player white shader
	instance_create_layer(oPlayerOW.x, oPlayerOW.y, "PlayerShaderFX", oPlayerWhiteShader);
	
	//Creates wave FX
	var _myWave = instance_create_layer(x, y, "Text", oSoundWaveFX);
	_myWave.soundIndex = soundIndex;
	array_push(playerSolution, soundIndex);	
}

//When you press reset button
resetInputs = function()
{
	performing = true;
	audio_play_sound(sndExclamation, 50, false);
	playerSolution = [];
	performing = false;
}