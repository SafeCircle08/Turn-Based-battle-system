x = global.boxOriginX;
y = global.boxOriginY;
xspd = 5;
yspd = 5;
sprite_index = sElectron;
image_speed = xspd / 2;
image_xscale = 0.5;
image_yscale = 0.5;
timer = 100;
xSign = undefined;
ySign = undefined;
instance_create_layer(x, y, "Bullets", oShake);

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
		if (x + _w >= global.border_r) { xspd *= -1; oShake.shake = true; audio_play_sound(sndBallBounce, 50, false); }
	} 
	else
	{
		if (x - _w <= global.border_l) { xspd *= -1;  oShake.shake = true; audio_play_sound(sndBallBounce, 50, false); }
	}

	if (yspd > 0)
	{
		if (y + _h >= global.border_d) { yspd *= -1; oShake.shake = true; audio_play_sound(sndBallBounce, 50, false); }
	}
	else
	{
		if (y - _h <= global.border_u) { yspd *= -1; oShake.shake = true; audio_play_sound(sndBallBounce, 50, false); }
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
		if (x + _w >= global.border_r) { xSign *= -1; x -= 10; oShake.shake = true; audio_play_sound(sndBallBounce, 50, false); }
	}
	if (xspd * xSign < 0)
	{
		if (x - _w <= global.border_l) { xSign *= -1; x += 10;  oShake.shake = true; audio_play_sound(sndBallBounce, 50, false); }
	}

	if (yspd * ySign > 0)
	{
		if (y + _h >= global.border_d) { ySign *= -1; y -= 10; oShake.shake = true; audio_play_sound(sndBallBounce, 50, false); }
	}
	if (yspd * ySign < 0)
	{
		if (y - _h <= global.border_u) { ySign *= -1; y += 10; oShake.shake = true; audio_play_sound(sndBallBounce, 50, false); }
	}	
}
moveState = moveElectron;

//Functions for creating the different "balls"
createProton = function(_x, _y, _xspd, _yspd, _xSign, _ySign, _timer)
{
	var _obj = instance_create_layer(_x, _y, "Bullets", oBallBullet);
	with (_obj)
	{
		xspd = _xspd;
		yspd = _yspd;
		xSign = _xSign;
		ySign = _ySign;
		timer = _timer;
		image_xscale = 1;
		image_yscale = 1;
		sprite_index = sProton;
		moveState = moveProton;
	}	
}
createElectron = function(_x, _y, _xspd, _yspd, _xSign, _ySign)
{
	var _obj = instance_create_layer(_x, _y, "Bullets", oBallBullet);
	with (_obj)
	{
		xspd = _xspd;
		yspd = _yspd;
		xSign = _xSign;
		ySign = _ySign;
		image_xscale = 0.5;
		image_yscale = 0.5;
		sprite_index = sElectron;
		moveState = moveElectron;
	}	
}