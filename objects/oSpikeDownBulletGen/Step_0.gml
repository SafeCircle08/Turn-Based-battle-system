event_inherited();

//The x position
var _steamPattern = [115, 130, 145, 160, 205, 220]
//The x position
var _slowSteam = [175, 190];


if (global.created == false)
{
	slowSteamTimer = setTimer(slowSteamTimer);
	if (slowSteamTimer == 0)
	{
		var _index = irandom_range(0, 1);
		var _slowy = instance_create_layer(_slowSteam[_index], global.border_d + 10, "Bullets", oBulletSteam);
		_slowy.accValue = 10;
		instance_create_layer(_slowSteam[_index], global.border_d - 10, "Bullets", oExclamationMark);
		audio_play_sound(sndExclamation, 50, false, global.soundGain);
		slowSteamTimer = 50;
	}
	
	if (global.createTimer > 0) { global.createTimer-- };
	
	if (global.createTimer == 0)
	{			
		for (var i = 0; i < 5; i++)
		{
			var _actualBullet = global.bulletsCreated;
			var _groupSteam = instance_create_layer(_steamPattern[i], global.border_u - 12, "Bullets", oBulletSteamDown);
			_groupSteam.acceleration = false;
		}
		global.createTimer = 30;
	}	
}