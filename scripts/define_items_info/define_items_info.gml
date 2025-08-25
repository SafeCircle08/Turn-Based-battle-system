#macro MAX_PROPERTIES_NUMBER 3
#macro MAX_ITEMS_NUM 8
#macro MAX_CHARS_FOR_LINE 17
global.itemsInGame = [];
global.equippedItems = [];

function hpMessage(_msg, _hp) { 
	var _hpMsg = "(Recovers " + string(_hp) + "HPs)";
	if (digitNotEqualsToSpecialChars(_msg)) { return changeLastDigit(_msg) + _hpMsg; }
	return _msg + "\n" + _hpMsg;
}

function fullHpMessage(_msg) {
	var _hpMaxed = "HPs MAXED OUT!";
	if (digitNotEqualsToSpecialChars(_msg)) { return changeLastDigit(_msg) + _hpMaxed; }
	return _msg + "\n" + _hpMaxed;		
}

function changeItemPropertiesList(_item, _newPropertyList) {
	_item.propertiesList = _newPropertyList;
	return;
}

function fillInventory(_specificItem = undefined) {
	for (var i = 0; i < MAX_ITEMS_NUM; i++) {
		if (_specificItem != undefined) {
			global.equippedItems[i] = _specificItem;
			continue;
		}
		var _index = irandom_range(0, array_length(global.itemsInGame) - 1);
		var _randomItem = global.itemsInGame[_index];
		global.equippedItems[i] = _randomItem;
	}
}

function createNewItem(_name, spr, _hp, _outSound, propList, _info, fullHpTxt, outPutMsg, 
_method_1 = function() {}, _method_2 = function() {}, _method_3 = function() {}) {
	var item = {
		name: _name,
		sprite: spr,
		hp: _hp,
		outSound: _outSound,
		propertiesList: propList,
		info: _info,
		fullHPText: fullHpTxt,
		outPutMessage: outPutMsg,
		_itemFuncs: [
			_method_1,
			_method_2,
			_method_3
		],
		enchants: [],
		enchanted: false
	}
	array_push(global.itemsInGame, item);
	return item;
}

global.pizza = createNewItem("Pizza", sPizza, 200, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	[hpMessage("A slice of pepperoni pizza.", 200)],
	[fullHpMessage("That pizza was incredible!")],
	["You ate a slice of pizza! It was mid tho..."],
	method(self, function() { healPlayer(200, sndPlayerEatingHeal); }));

global.kfc = createNewItem("KFC", sKfc, 150, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	[hpMessage("Made in Kentucky with LOVE!", 150)],
	[fullHpMessage("Fried the right way!")],
	["You became a black ninja! How awesome isnt it"],
	method(self, function() { healPlayer(150, sndPlayerEatingHeal); }));

global.candy = createNewItem("Candy", sCandy, 200, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_SPD, ITEM_PROPERTY_NOONE],
	[hpMessage("Just take one and you'll be fine", 200)],
	[fullHpMessage("You took one. You feel fine.")],
	["You took one candy... You would like to take more, but you can't..."],
	method(self, function() { healPlayer(200, sndPlayerEatingHeal); }));

global.joice = createNewItem("Joice", sJoiceItem, 233, sndPlayerDrinkingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DEF, ITEM_PROPERTY_NOONE],
	[hpMessage("JOICE, the juice made with joy!", 233)],
	[fullHpMessage("Drinking JOICE made your day better!")],
	["Oh Man, one sip of Joice is enough to make a grown man cry..."],
	method(self, function() { healPlayer(233, sndPlayerDrinkingHeal); }));

global.cyanide = createNewItem("CN-", sCyanideItem, -237, sndPlayerEatingHeal,
	[ITEM_PROPRTY_BIO_HAAZARD, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	["A pill of cyanide. You would never eat this."],
	["There is no HP lol"],
	["Why did you do that like, are you stupid or what like idk..."],
	method(self, function() { hitPlayer(233); }));

global.honeyHoneyComb = createNewItem("HHComb", sHHComb, 150, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DEF, ITEM_PROPERTY_NOONE],
	[hpMessage("A HoneyComb made of Honey", 150)],
	[fullHpMessage("That taste... Thank you Glucose for existing!")],
	["You ate the HHComb so quicly your hands got dirty."],
	method(self, function() { healPlayer(150, sndPlayerEatingHeal); }));

global.painKiller = createNewItem("P.Kill", sPainKillerItem, 35, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	[hpMessage("Found by chance among some wraps.", 35)],
	[fullHpMessage("This Pill was enough to stop your pains")],
	["Your " + string(choose("stomach", "head", "leg", "back", "arms")) + " still hurts, but it's bearable."],
	method(self, function() { healPlayer(25, sndPlayerEatingHeal); }));

global.bandages = createNewItem("M.Wraps", sBandagesItem, 215, sndPlayerBasicHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DOUBLE_HEAL, ITEM_PROPERTY_ADD_TO_INV],
	[hpMessage("Bandages used to treat Injuries", 215)],
	[fullHpMessage("Your deepest wounds got healed")],
	["Cuts are less annoying if they are protected."],
	method(self, function() { healPlayer(global.bandages.hp, global.bandages.outSound);}),
	method(self, function() { healPlayer(global.bandages.hp, global.bandages.outSound);}),
	method(self, function() { addItemToInventory(global.painKiller); }));
	
global.mint = createNewItem("Dropint", sMintDrop, 75, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	[hpMessage("Gathered from pine drops.", 75)],
	[fullHpMessage("Fresh. Winter. Snow. Cold")],
	["Make sure not to drink fresh water in the next 5 minutes!"],
	method(self, function() { healPlayer(global.mint.hp, global.mint.outSound); }))
	
global.cocoMilk = createNewItem("C.Milk", sCocoMilk, 122, sndPlayerDrinkingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	[hpMessage("Gives a awesome feeling of fresh.", 122)],
	[fullHpMessage("This milk really refreshed you!")],
	["This milf really gives you that summer feeling! Sadly..."],
	method(self, function() { healPlayer(global.cocoMilk.hp, global.cocoMilk.outSound); }))	

function cadAddToInventory() {
	if (array_length(global.equippedItems) + 1 <= MAX_ITEMS_NUM) { return true; }
	return false;
}

randomize();
fillInventory();

function addItemToInventory(_specificItem = undefined) {	
	if (cadAddToInventory()) {
		if (_specificItem != undefined) {
			array_push(global.equippedItems, _specificItem);	
		} else {
			var _inGameItemsNum = array_length(global.itemsInGame);
			var _index = irandom_range(0, _inGameItemsNum - 1);	
			array_push(global.equippedItems, global.itemsInGame[_index]);
			return ["<>We left you a little surprise\n  in your inventory!\n  -SYP-"]
		}
	}
	return ["<>We tried to make you a gift,\n  but there wasn't any space ;(\n  -SYP-"]
}