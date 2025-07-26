#macro WANTED_FPS 60

function setOptimalHardwareSettings()
{
	setOptimalDisplaySettings(WANTED_FPS);
	game_set_speed(WANTED_FPS, gamespeed_fps);
	display_reset(8, true);
	display_set_timing_method(tm_countvsyncs);
	//window_set_fullscreen(true);
}

setOptimalHardwareSettings();