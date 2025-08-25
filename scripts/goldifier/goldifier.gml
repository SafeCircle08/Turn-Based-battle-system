function goldifier(){
	var _goldAmount = irandom_range(52, 204);
	global.playerGold += _goldAmount;
	if (!audio_is_playing(sndGettingGold)) {
		var _soundGain = 0.6;
		playSound(sndGettingGold, SOUND_CHANNEL_1, false, _soundGain);
	}
}