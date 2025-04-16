if (energyTimer > 0)
{
	energyTimer--;
	if (image_xscale < maxScaleX + 200)
	{
		image_xscale += ((70 - image_xscale) / 15)	
	}
	//-----TO DO-----
	//Per dare l'effetto di blocco se
	//se si usa uno scudo
	//if (place_meeting(x, y, oDefenceThing))
	//{
		//energyTimer = 0;	
	//}
	//----------------
}  

if (energyTimer == 0) 
{ 
	image_alpha -= 0.07 
}

if (image_alpha < 0) 
{
	instance_destroy();	
}

if (image_yscale < maxScaleY)
{
	image_yscale += ((2 - image_yscale) / 2)	
}
if (image_yscale > maxScaleY)
{
	image_yscale -= ((1.5 - image_yscale) / 2)	
}	