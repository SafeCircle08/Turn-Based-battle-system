#macro MAX_ENCHANTS_PER_ITEM_NUM 3

function addEnchant(_enchantsList) {
	var _index = irandom_range(0, array_length(global.enchantsInGame) - 1);
	var _choosenEnchant = global.enchantsInGame[_index];
	array_push(_enchantsList,_choosenEnchant);	
	return _enchantsList;
}

function canEnchant(_enchantsList) {
	if (array_length(_enchantsList) < MAX_ENCHANTS_PER_ITEM_NUM) {
		return true;
	}
	return false;
}

function changeToNewEnchants(_changedItem) {
	with (oBattleManager) {
		global.equippedItems[selected_option] = _changedItem;
	}
}

function isEnchanted(_item) {
	return _item.enchanted;	
}

function enchantItem(_item)
{
	var _changedItem = variable_clone(_item);
	_changedItem.enchanted = true;
	if (canEnchant(_item.enchants)) {
		addEnchant(_changedItem.enchants);	
		changeToNewEnchants(_changedItem);
		playSound(sndEnchanting, SOUND_CHANNEL_1);
	}
	return;
}

function disenchantItem(_item) {
	if (isEnchanted(_item))
	{
		var _disenchantedItem = variable_clone(_item);
		_disenchantedItem.enchanted = false;
		_disenchantedItem.enchants = [];
		playSound(sndDisenchanting, SOUND_CHANNEL_1);
		changeToNewEnchants(_disenchantedItem);
	}
}