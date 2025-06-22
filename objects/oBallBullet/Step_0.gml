//Le palle aumentano in modo esponenziale
//perchè la funzione è chiamata dalla palla stessa
//quindi si raddoppieranno ogni volta.
//Per superare il problema, semplicemente crea
//un bullet generator esterno, indipendente dalle palle;

var _xL = global.border_l;
var _xR = global.border_r;
var _yU = global.border_u;
var _yD = global.border_d;
var _h = sprite_get_height(sprite_index) / 4;

if (y + _h >= _yD) && (collided == false)
{  
	collided = true;
	hspeed = 0;
	vspeed = 0;
	gravity = 0;
}

if (collided == false) { exit; }

moveState();