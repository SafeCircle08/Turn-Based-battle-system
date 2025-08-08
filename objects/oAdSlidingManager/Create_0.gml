possibleSprites = [
	sPickleSodaAd,
	sPizzaAd,
	sHorrorAd,
	sWorldAd,
	sJollyAd,
	sHealAd,
	sGuitarAd,
	sTvAd,
	sCityAd,
	sCryptoAd
];
adNumber = 30;
index = irandom_range(0, array_length(possibleSprites) - 1);
adSprite = possibleSprites[index];
_sign = 1;

xPos = 0;
yPos = 0;

//Vals
xAdder = 0;
yAdder = 0.5;
scaleX = 1;
scaleY = 1;
alpha = 1;

createAd = function(_obj, _sprite, scale_x, scale_y, _alpha)
{
	_obj.sprite_index = _sprite;
	_obj.image_xscale = scale_x;
	_obj.image_yscale = scale_y;
	_obj.image_alpha = _alpha;
	_obj.xSpd = xAdder * _sign;
	_obj.ySpd = yAdder * _sign;
}
createVerticalAds = function()
{
	var _x = xPos;
	var _y = 0;
	for (var i = 0; i < adNumber; i++)
	{ 
		var _index = irandom_range(0, array_length(possibleSprites) - 1);
		var _adSprite = possibleSprites[_index];
		var _adH = sprite_get_height(_adSprite);
		var _myAd = instance_create_layer(_x, _y + 2 * i - 20 * adNumber, LAYER_EFFECT_TOP, oAdSliding);
		createAd(_myAd, _adSprite, scaleX, scaleY, alpha);
		_y += _adH;
	}
	instance_destroy(self);
}
createHorizontalAds = function()
{
	var _x = 0;
	var _y = yPos;
	for (var i = 0; i < adNumber; i++)
	{ 
		var _index = irandom_range(0, array_length(possibleSprites) - 1);
		var _adSprite = possibleSprites[_index];
		var _adW = sprite_get_width(_adSprite) * scaleX;
		var _myAd = instance_create_layer(_x + 2 * i - 120, _y, LAYER_EFFECT_TOP, oAdSliding);
		createAd(_myAd, _adSprite, scaleX, scaleY, alpha);
		_x += _adW;
	}
	instance_destroy(self);
}
