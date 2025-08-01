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