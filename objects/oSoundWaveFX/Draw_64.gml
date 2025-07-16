if (reachedOne == false)
{
	if (myAlpha < 1) 
	{ 
		myAlpha += 0.05; 
	}
	else
	{
		reachedOne = true;
	}
}

sndTimer = setTimer(sndTimer);

//Plays the sound
if (sndTimer == 0)
{
	audio_play_sound(soundIndex, 50, false);
	sndTimer = -1;
}

//Increase the frames
if (sndTimer == -1)
{
	moveTimer = setTimer(moveTimer);
	if (moveTimer == 0) { frameSpd += 0.3; }
}

//When the wave is at the end
if (frameSpd >= 74)
{
	if (instance_exists(oPlayerWhiteShader)) { instance_destroy(oPlayerWhiteShader); }
	myAlpha -= 0.05;
	if (myAlpha <= -0.5) {
		oPlayerOW.canMove = true;
		oBellPuzzleManager.performing = false;
		instance_destroy(oPlayerWhiteShader);
		instance_destroy(self);
	}
}

//Clamps the value
frameSpd = clamp(frameSpd, 0, 74);

//Draws the effect
var _x = surface_get_width(application_surface) / 2;
var _y = surface_get_height(application_surface) / 2 - 300;
draw_sprite_ext(sAudioWave, frameSpd, _x, _y, 1, 1, 0, c_white, myAlpha);