x -= spd;
wrapAround(sMineLamp);
frame++;

if (falling == true) 
{ 
	if (setValues == false)
	{
		spd = 0;
		vspeed = -6;
		gravity = 0.3;		
		setValues = true;
	}
	fallingFunction(); 
	exit; 
}
y = ystart + sin(frame / 15) * 5;