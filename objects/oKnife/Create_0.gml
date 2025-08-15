image_alpha = 0;
goalDir = point_direction(x, y, oSoul.x, oSoul.y);
image_angle = goalDir - 60;
frame = 0;
timer = 0;
launched = false;

var soundGain = 0.7;
playSound(sndAllert_1, SOUND_CHANNEL_1, false, soundGain);