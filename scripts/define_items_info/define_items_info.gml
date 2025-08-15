#macro MAX_PROPERTIES_NUMBER 3
#macro ITEM_PROPERTY_HEAL sHealProperty 
#macro ITEM_PROPERTY_SPD sSpeedProperty
#macro ITEM_PROPERTY_DEF sDefenceProperty
#macro ITEM_PROPERTY_NOONE sNooneProperty
#macro ITEM_PROPERTY_STRENGTH sStrengthPropery
#macro ITEM_PROPERTY_HELLO_WORLD sHelloWorldProperty 
#macro ITEM_PROPERTY_JUMP_BOOST sJumpBoostPropery
#macro ITEM_PROPERTY_INVISIBILITY sInvisibleProperty
#macro ITEM_PROPRTY_BIO_HAAZARD sBioHaazardProperty
#macro ITEM_PROPERTY_DOUBLE_HEAL sDoubleHealProperty
#macro ITEM_PROPERTY_ADD_TO_INV	 sAddToInvProp

#macro MAX_ITEMS_NUM 8
global.itemsInGame = [];
global.equippedItems = [];

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
		]
	}
	array_push(global.itemsInGame, item);
	return item;
}

global.pizza = createNewItem("Pizza", sPizza, 200, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_STRENGTH, ITEM_PROPERTY_DEF],
	["A slice of pepperoni pizza...\nRecovers 200HPs"],
	["That pizza was so awesome TwT\nHPs MAXED OUT!"],
	["You ate a slice of pizza! It was mid tho..."],
	method(self, function() { healPlayer(200, sndPlayerEatingHeal); }));

global.kfc = createNewItem("KFC", sKfc, 150, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DEF, ITEM_PROPERTY_NOONE],
	["There are too many reels...\nRecovers 150 HPs"],
	["Run run run!\nHPs MAXED OUT!"],
	["You became a black ninja! How awesome isnt it"],
	method(self, function() { healPlayer(150, sndPlayerEatingHeal); }));

global.candy = createNewItem("Candy", sCandy, 200, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_SPD, ITEM_PROPERTY_DEF],
	["Just take ONLY one candy!\nRecovers 200 Hps"],
	["That candy reminded you of Christmas.\nHPs MAXED OUT!"],
	["You took one candy... You would like to take more, but you can't..."],
	method(self, function() { healPlayer(200, sndPlayerEatingHeal); }));

global.joice = createNewItem("Joice", sJoiceItem, 233, sndPlayerDrinkingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DEF, ITEM_PROPERTY_JUMP_BOOST],
	["JOICE, the Juice made with Joy!\nRecovers 233 HPs"],
	["Drinking Joice made your day better!\nHPs MAXED OUT!"],
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
	["A Honey Comb made of Honey.\nRecovers 150 HPs"],
	["That taste... Thank you glucose for existing!\nHPs MAXED OUT!"],
	["You ate the HHComb so quicly your hands got dirty."],
	method(self, function() { healPlayer(150, sndPlayerEatingHeal); }));

global.painKiller = createNewItem("P.Kill", sPainKillerItem, 35, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	["Found by chance among some wraps.\nRecovers 30 HPs."],
	["A simple pill was enough to stop your aches.\nHPs MAXED OUT!"],
	["Your " + string(choose("stomach", "head", "leg", "back", "arms")) + " stomach still hurts, but it's bearable."],
	method(self, function() { healPlayer(25, sndPlayerEatingHeal); }));

global.bandages = createNewItem("M.Wraps", sBandagesItem, 20, sndPlayerBasicHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_DOUBLE_HEAL, ITEM_PROPERTY_ADD_TO_INV],
	["Bandages used to treat Injuries.\nRecovers 125 HPs"],
	["Your deepest wounds got healed!\nHPs MAXED OUT!"],
	["Cuts are less annoying if they are protected."],
	method(self, function() { healPlayer(global.bandages.hp, global.bandages.outSound);}),
	method(self, function() { healPlayer(global.bandages.hp, global.bandages.outSound);}),
	method(self, function() { addItemToInventory(global.painKiller); }));
	
global.mint = createNewItem("Dropint", sMintDrop, 75, sndPlayerEatingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	["Gathered from pine drops in Winter.\nRecovers 75 Hps"],
	["Fresh.\nWinter.\nHPs MAXED OUT!"],
	["Make sure not to drink fresh water in the next 5 minutes!"],
	method(self, function() { healPlayer(global.mint.hp, global.mint.outSound); }))
	
global.cocoMilk = createNewItem("C.Milk", sCocoMilk, 122, sndPlayerDrinkingHeal,
	[ITEM_PROPERTY_HEAL, ITEM_PROPERTY_NOONE, ITEM_PROPERTY_NOONE],
	["Dying because of the heat? Try this!\nRecovers 122 HPs."],
	["This milk really refreshed me!\nHPs MAXED OUT!"],
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