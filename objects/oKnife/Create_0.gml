image_alpha = 0;
goalDir = point_direction(x, y, oSoul.x, oSoul.y);
image_angle = goalDir - 60;
frame = 0;
timer = 0;
launched = false;
audio_play_sound(sndAllert_1, 50, false, global.soundGain + 1);