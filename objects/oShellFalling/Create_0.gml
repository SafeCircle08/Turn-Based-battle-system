randomize();

image_speed = 1;
image_alpha = 1;
vspeed = irandom_range(-1, -2);
hspeed = irandom_range(-2, 2);
while(hspeed == 0) { hspeed = irandom_range(-1, 1); }

gravity = 0.05;

audio_play_sound(sndBulletPopping, 55, false, global.soundGain);
audio_play_sound(sndBulletPoppingBG, 55, false, global.soundGain);
image_xscale = 0.7;
image_yscale = 0.7;