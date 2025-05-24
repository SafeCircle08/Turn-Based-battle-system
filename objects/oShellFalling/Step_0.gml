image_angle += 10;
if (y >= room_height / 2) { image_alpha -= 0.05; }
if (image_alpha <= 0) 
{ 
	audio_play_sound(sndShellHittingGround, 60, false, global.soundGain); 
	instance_destroy(self); 
}