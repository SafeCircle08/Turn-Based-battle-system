noteTimer = 0;
actualTimer = noteTimer;
triangle = 0;
angles = 0;
frame = 0;
frameSign = 1;
xAdder = 0;
yAdder = 0;
stereoStepEvent = 0;

createNotes = function()
{
	image_index = clamp(image_index, 0, image_number);
	if (image_index == image_number) { image_index = 0 }
	if (image_index == 4)
	{
		audio_play_sound(sndBallBounce, 50, false);
		var _angles = angles;
		for (var i = 1; i < 4; i++)
		{
			triangle = instance_create_layer(x, y, "Instances", oNoteBullet);
			triangle.image_angle = _angles[i];
		}
	}	
}