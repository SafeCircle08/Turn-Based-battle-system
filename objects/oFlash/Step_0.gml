if (image_alpha < 1 && flashed == false) { image_alpha += 0.1; }
if (image_alpha == 1) { flashed = true };
if (flashed == true && image_alpha > 0)
{
	image_alpha -= 0.1;
}
if (image_alpha <= 0) { instance_destroy(self); }