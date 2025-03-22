event_inherited();

if (!instance_exists(oWeightTrigger))
{
	var _width = global.borderWidth - 1;
	var _height = (global.borderHeight / 2) - 15;
	var _XX = global.boxOriginX - (global.borderWidth / 2) + 1
	var _yyHigh = global.boxOriginY - (global.borderHeight / 2) + 1
	var _yyDown = global.boxOriginY + (global.borderHeight / 2) - 1
	instance_create_layer(_XX, _yyHigh, "Bullets", oWeightTrigger);
	instance_create_layer(_XX, _yyDown - _height, "Bullets", oWeightTrigger);
	oWeightTrigger.image_xscale = _width;
	oWeightTrigger.image_yscale = _height + 2;
}

timer = setTimer(timer);
if (timer == 0)
{	
	global.boxOriginX += 0.1;
	global.borderWidth -= 0.2;	
}

var _pos = 
[
	[-20, -40],
	[90, 90],
];

var _xx = _pos[0][global.bulletsCreated];
var _yy = _pos[1][global.bulletsCreated];

createBullets(_xx, _yy, "Bullets", oElectronBullet, 20, 1, false);

if (global.bulletsCreated == 2) { global.bulletsCreated = 0; }

//Generates the blasters
if (oRectangleIndicator.weight == 100)
{
	oBlasterLineGenerator.createBlaster = true;
}