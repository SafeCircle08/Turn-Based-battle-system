event_inherited();

setBoxOrigin(room_width / 2, room_width / 2 - 50);
boxDimensions(170, 100);
genTimeVars(0, false, 750, 0);
playerChangeState(oSoul.stateFree, sNoEffects);
frame = 0;

createProton = function(_x, _y, _xspd, _yspd, _xSign, _ySign, _timer, _vsp, _hsp, _grv)
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
		vspeed = _vsp;
		hspeed = _hsp;
		gravity = _grv;
		moveState = moveProton;
	}	
}
createElectron = function(_x, _y, _xspd, _yspd, _xSign, _ySign, _vsp, _hsp, _grv)
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
		vspeed = _vsp;
		hspeed = _hsp;
		gravity = _grv;
		moveState = moveElectron;
	}	
}