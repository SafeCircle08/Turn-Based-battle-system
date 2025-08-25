#macro ENTER_KEY vk_enter

function pressedEnter(_sound = sndSelecting_2, _channel = SOUND_CHANNEL_1){
	if (keyboard_check_pressed(ENTER_KEY)) {
		playSound(_sound, SOUND_CHANNEL_1);
		return true;	
	}
	return false;
}

function pressingEnter(_sound = sndSelecting_2, _channel = SOUND_CHANNEL_1){
	if (keyboard_check(ENTER_KEY)) {
		playSound(_sound, SOUND_CHANNEL_1);
		return true;	
	}
	return false
}