function navigatingBattle(_minClam, _maxClamp)
{
	var _firstValue = selected_option;
	if keyboard_check_pressed(ord("S")) { selected_option++; }
	if keyboard_check_pressed(ord("W")) { selected_option--; }
	
	selected_option = clamp(selected_option, _minClam, _maxClamp);
	
	var soundGain = 0.6;
	if (selected_option != _firstValue) { playSound(sndNavigating_2, SOUND_CHANNEL_2, false, soundGain); }	
}