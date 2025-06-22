function createRandomKnife(_index = noone)
{
	var _posX =  [oSoul.x + 40, oSoul.y - 40];
	var _posY = [oSoul.y + 40, oSoul.y - 40];
	if (_index == noone) { _index = irandom_range(0, 1); }
	instance_create_layer(_posX[_index],  _posY[_index], "Bullets", oKnife);		
}