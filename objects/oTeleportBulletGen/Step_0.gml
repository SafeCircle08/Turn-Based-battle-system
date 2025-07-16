event_inherited();
randomize();

var _positions = 
[
	//X origin
	[130, 225, 127, 278, 48],
	//Y origing
	[100, 95, 96, 159, 142],
	//Width
	[384, 192, 128, 64, 40],
	//Heigth
	[384, 192, 128, 64, 40],
];

if (instance_exists(oDocumentBullet)) { oDocumentBullet.canCreate = false; }

if (changeTimer > 0) { changeTimer-- }

if (changeTimer == 50)
{
	var _length = array_length(_positions[0]) - 1

	if (index + 1) > _length { index = 0 }
	else { index = index + 1 }  

	instance_create_layer(_positions[0][index], _positions[1][index], LAYER_BULLETS, oBoxPointer);
}

if (changeTimer == 0)
{		
	oSoul.x = _positions[0][index];
	oSoul.y = _positions[1][index];
	
	global.borderHeight = _positions[3][index];
	global.borderWidth = _positions[2][index];
	global.boxOriginX = _positions[0][index];
	global.boxOriginY = _positions[1][index];
	changeTimer = 100;
}

if (global.created == false)
{
	var _xx = irandom_range(10, 300);
	var _yy = irandom_range(10, 250);
	createBullets(_xx, _yy, LAYER_BULLETS, oDocumentBullet, 45, 4, false)
}