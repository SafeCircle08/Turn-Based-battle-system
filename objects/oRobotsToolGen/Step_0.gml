// Inherit the parent event
event_inherited();

if (global.created == false)
{	
	for (var i = 0; i < 2; i++)	
	{
		robotSpeeds = robots[i][3];
		robotLeft = robots[i][4];
		//-------------------------------------------------------------------------
		instance_create_layer(robots[i][1], robots[i][2], "Bullets", robots[i][0]);
		if (i == 0) { global.created = true; }
	}	 
}