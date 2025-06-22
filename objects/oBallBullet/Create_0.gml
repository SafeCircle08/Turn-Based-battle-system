xspd = 3;
yspd = 3;
sprite_index = sElectron;
image_speed = xspd / 2;
image_xscale = 0.5;
image_yscale = 0.5;
timer = 100;
xSign = undefined;
ySign = undefined;
instance_create_layer(x, y, "Bullets", oShake);
timer = 0;
collided = false;

//Methods that determine the actual 
//movement the "balls" have to follow
moveElectron = function()
{	
	x += xspd;
	y += yspd;
	
	var _w = sprite_get_width(sprite_index) / 4; 
	var _h = sprite_get_height(sprite_index) / 4;
	var _dur = 5;

	if (delta_time % 5 == 0)
	{
		ballEffect = instance_create_layer(x, y, "Bullets", oBallEffect);
		ballEffect.sprite_index = sprite_index;
		ballEffect.image_xscale = image_xscale;
		ballEffect.image_yscale = image_yscale;
	}

	if (xspd > 0)
	{
		if (x + _w >= global.border_r) 
		{ 
			xspd *= -1; 
			oShake.shake = true; 
			audio_play_sound(sndBallBounce, 50, false, global.soundGain); 
		}
	} 
	else
	{
		if (x - _w <= global.border_l) 
		{ 
			xspd *= -1;  
			oShake.shake = true; 
			audio_play_sound(sndBallBounce, 50, false, global.soundGain); 
		}
	}
	if (yspd > 0)
	{
		if (y + _h >= global.border_d)
		{ 
			yspd *= -1; 
			oShake.shake = true; 
			audio_play_sound(sndBallBounce, 50, false, global.soundGain);
		}
	}
	else
	{
		if (y - _h <= global.border_u) 
		{
			yspd *= -1;
			oShake.shake = true; 
			audio_play_sound(sndBallBounce, 50, false, global.soundGain);
		}
	}		
}
moveProton = function()
{
	var _w = sprite_get_width(sprite_index) / 2; 
	var _h = sprite_get_height(sprite_index) / 2;
	var _dur = 5;
	timer = setTimer(timer);
	
	//The movement
	if (timer <= 50)
	{
		x += xspd * xSign;
		y += yspd * ySign;
		if (timer == 0) { timer = irandom_range(60, 100); }
	}

	if (delta_time % 5 == 0)
	{
		ballEffect = instance_create_layer(x, y, "Bullets", oBallEffect);
		ballEffect.sprite_index = sprite_index;
		ballEffect.image_xscale = image_xscale;
		ballEffect.image_yscale = image_yscale;
	}
	
	if (xspd * xSign > 0)
	{
		if (x + _w >= global.border_r) 
		{ 
			xSign *= -1; x -= 10; 
			oShake.shake = true; 
			audio_play_sound(sndBallBounce, 50, false, global.soundGain); 
		}
	}
	if (xspd * xSign < 0)
	{
		if (x - _w <= global.border_l) 
		{
			xSign *= -1; x += 10;  
			oShake.shake = true; 
			audio_play_sound(sndBallBounce, 50, false, global.soundGain); 
		}
	}
	if (yspd * ySign > 0)
	{
		if (y + _h >= global.border_d) 
		{ 
			ySign *= -1; y -= 10; 
			oShake.shake = true;
			audio_play_sound(sndBallBounce, 50, false, global.soundGain); 
		}
	}
	if (yspd * ySign < 0)
	{
		if (y - _h <= global.border_u) 
		{ 
			ySign *= -1; y += 10;
			oShake.shake = true; 
			audio_play_sound(sndBallBounce, 50, false, global.soundGain); 
		}
	}	
}

moveState = moveElectron;