if (!audio_is_playing(sndBallBounce))
{
	audio_play_sound(sndBallBounce, 20, false, global.soundGain);
}