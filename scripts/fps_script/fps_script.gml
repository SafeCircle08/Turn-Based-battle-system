#macro WANTED_FPS 60

global.gameFPS = 0;
function fps_script()
{
	global.gameFPS = display_get_frequency();
	game_set_speed(global.gameFPS, gamespeed_fps);
}

fps_script();