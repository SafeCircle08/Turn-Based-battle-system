#macro RESET_KEY ord("X")

function resetKey(_sound = sndResetNavigation, _channel = SOUND_CHANNEL_1){
	if (keyboard_check_pressed(RESET_KEY)) {
		if (!audio_is_playing(_sound)) {
			var _soundGain = 0.7;
			playSound(_sound, SOUND_CHANNEL_1, false, _soundGain);
		}
		return true;	
	}
	return false;
}