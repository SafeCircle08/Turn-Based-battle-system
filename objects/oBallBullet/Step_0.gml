//Le palle aumentano in modo esponenziale
//perchè la funzione è chiamata dalla palla stessa
//quindi si raddoppieranno ogni volta.
//Per superare il problema, semplicemente crea
//un bullet generator esterno, indipendente dalle palle;

if (keyboard_check_pressed(vk_enter))
{
	var _x = global.boxOriginX;
	var _y = global.boxOriginY;
	createProton(_x, _y, 2, 2, -1, -1, 100);
}

if (keyboard_check_pressed(vk_space))
{
	var _x = global.boxOriginX;
	var _y = global.boxOriginY;
	createElectron(_x, _y, 2, 2, -1, -1);
}

moveState();

show_debug_message(instance_number(oBallBullet));