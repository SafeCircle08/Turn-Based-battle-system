y = lerp(y, yGoal, 0.3);
x = lerp(x, xGoal, 0.3);

if (fading == true)
{
	y -= 1;
	image_alpha -= 0.05;
	if (image_alpha <= 0) { instance_destroy(self); }
	exit;
}

image_alpha += 0.05;