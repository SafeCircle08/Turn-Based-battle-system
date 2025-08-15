function callItemFunctions(_itemFuncList)
{
	for (var i = 0; i < MAX_PROPERTIES_NUMBER; i++) { 
		_itemFuncList[i](); 
	}	
}	

function removeItemFromInventory(_itemList, _index, _number = 1) {
	array_delete(_itemList, _index, _number);	
}

function playerFullHP(_addedHps) {
	return 	(global.playerHP + _addedHps >= global.playerMAX_HP) 
}

function usingItem(_index)
{
	var _actualItem = global.equippedItems[_index];
	var _itemFunctions = _actualItem._itemFuncs;
	var _gainedHps = _actualItem.hp;
	var _message;
	removeItemFromInventory(global.equippedItems, _index);

	if (playerFullHP(_gainedHps)) {
		callItemFunctions(_itemFunctions);
		_message = _actualItem.fullHPText;
		return _message;
	}
	callItemFunctions(_itemFunctions);
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