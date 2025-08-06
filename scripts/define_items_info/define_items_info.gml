#macro ITEM_PROPERTY_HEAL sHealProperty
#macro ITEM_PROPERTY_SPD sSpeedProperty
#macro ITEM_PROPERTY_DEF sDefenceProperty
#macro ITEM_PROPERTY_NOONE sNooneProperty
#macro ITEM_PROPERTY_STRENGTH sStrengthPropery
#macro ITEM_PROPERTY_HELLO_WORLD sHelloWorldProperty
#macro ITEM_PROPERTY_JUMP_BOOST sJumpBoostPropery
#macro ITEM_PROPERTY_INVISIBILITY sInvisibleProperty
#macro ITEM_PROPRTY_BIO_HAAZARD sBioHaazardProperty

#macro MAX_ITEMS_NUM 8
global.itemsInGame = [];

function createNewItem(_name, spr, _hp, propList, _info, fullHpTxt, outPutMsg)
{
	var item = {
		name: _name,
		sprite: spr,
		hp: _hp,
		propertiesList: propList,
		info: _info,
		fullHPText: fullHpTxt,
		outPutMessage: outPutMsg
	}
	array_push(global.itemsInGame, item);
	return item;
}

global.pizza = createNewItem("Pizza", sPizza, 200, 
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_STRENGTH, ITEM_PROPERTY_DEF],
	["A slice of pizza... You have bad feelings about it..."],
	["Pizza full hp text"],
	["You ate a slice of pizza! It wasn't good tho..."]);

global.kfc = createNewItem("KFC", sKfc, 150, 
	 [ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DEF, ITEM_PROPERTY_NOONE],
	["You have seen too many memes to take that seriusly..."],
	["kfc full hp text"],
	["You became a black ninja! How awesome isnt it"]);

global.candy = createNewItem("Candy", sCandy, 200,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_SPD, ITEM_PROPERTY_DEF],
	["Candy candy candy! Just take ONLY one candy!"],
	["That candy was so good you feel like you... ehr... Nevermind."],
	["You took one candy... You would like to take more, but you can't..."]);

global.joice = createNewItem("Joice", sJoiceItem, 233,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DEF, ITEM_PROPERTY_JUMP_BOOST],
	["!JOICE! The Juice made with Joy since -984!"],
	["Drinking Joy Juice (Joice) made your day better!\nHP maxed Out!"],
	["Oh Man, one sip of Joice is enough to make a grown man cry..."]);

global.cyanide = createNewItem("CN-", sCyanideItem, -237,
	[ITEM_PROPRTY_BIO_HAAZARD, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	["A pill of cyanide. You would never eat this."],
	["There is no HP lol"],
	["Why did you do that like, are you stupid or what like idk..."]);

//Start Inventory
global.equippedItems = [
	global.cyanide,
	global.kfc,
	global.joice,
	global.candy,
	global.pizza,
	global.joice,
	global.cyanide,
	global.joice
];

function cadAddToInventory()
{
	if (array_length(global.equippedItems) + 1 <= MAX_ITEMS_NUM) { return true; }
	return false;
}

function addItemToInventory()
{	
	if (cadAddToInventory())
	{
		var _inGameItemsNum = array_length(global.itemsInGame);
		var _index = irandom_range(0, _inGameItemsNum - 1);
		array_push(global.equippedItems, global.itemsInGame[_index]);
		return ["<>We left you a little surprise\n  in your inventory!\n  -SYP-"]
	}
	return ["<>We tried to make you a gift,\n  but there wasn't any space ;(\n  -SYP-"]
}