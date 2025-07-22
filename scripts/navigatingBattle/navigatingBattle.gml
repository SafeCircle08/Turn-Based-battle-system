function navigatingBattle(_minClam, _maxClamp)
{
	var _firstValue = selected_option;
	if keyboard_check_pressed(ord("S")) { selected_option++; }
	if keyboard_check_pressed(ord("W")) { selected_option--; }
	
	selected_option = clamp(selected_option, _minClam, _maxClamp);
	
	//If i actually moved with the navigation
	if (selected_option != _firstValue) { audio_play_sound(sndNavigating, 50, false, global.soundGain); }	
}