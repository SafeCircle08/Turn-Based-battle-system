global.items[0] = "Pizza"
global.items[1] = "Candy"
global.items[2] = "Spd. Pot."
global.items[3] = "Kfc" 

/*
//GLI STRUCS SI POSSONO ANCHE ANNIDARE (FICO)
global.ITEMS =
{
	pizza:
	{
		sprite: sPizza,
		hp: 100,
	},
	kfc:
	{
		sprite: sKfc,
		hp: 300
	}
}
*/

#region Da fare testing con questi dizionari

global.pizza =
{
	name: "Pizza",
	sprite: sPizza,
	hp: 200, 
	info: ["A slice of pizza... You have bad feelings about it..."],
	fullHPText: ["Pizza full hp text"],
	outPutMessage: ["You ate a slice of pizza! It wasn't good tho..."]
}

global.kfc =
{
	name: "KFC",
	sprite: sKfc,
	hp: 33,
	info: ["You have seen too many memes to take that seriusly..."],
	fullHPText: ["kfc full hp text"],
	outPutMessage: ["You became a black ninja! How awesome isnt it"]
}

global.candy =
{
	name: "Candy",
	sprite: sCandy,
	hp: 200,
	info: ["Candy candy candy! Just take ONLY one candy!"],
	fullHPText: ["That candy was so good you feel like you... ehr... Nevermind."],
	outPutMessage: ["You took one candy... You would like to take more, but you can't..."]
}
#endregion


global.itemsSprites =
{
	pizza: sPizza,
	spdPot: sSpdPotion,
	candy: sCandy,
	kfc: sKfc,
}

global.equippedItems = [
	global.pizza,
	global.kfc,
	global.candy,
	global.candy
]

global.itemSpriteDraw = global.itemsSprites.pizza;

function usingItem(_index)
{
	var _actualItem = global.equippedItems[_index];
	var _gainedHP = _actualItem.hp;
	var _message;
	global.playerHP += _gainedHP;
	if (global.playerHP + _gainedHP >= global.playerMAX_HP)
	{
		_message = _actualItem.fullHPText;
		return _message;
	}
	_message = _actualItem.outPutMessage;
	return _message;
}

function itemInfo(_index)
{
	var _actualItem = global.equippedItems[_index];
	var _itemInfo = _actualItem.info;
	global.itemSpriteDraw = _actualItem.sprite;
	return _itemInfo;
}