xspd = 0;
yspd = 0;
amount = 0;
image_alpha = 0;
sprite_index = sIron;

myFXFunction = function()
{
	x += xspd;
	y += yspd;
	changeAlpha(self, 0, amount, true);
	changeDim(self, 4, 10, 0.1);
}