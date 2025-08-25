//Main menu macros
#macro MAIN_MENU_BATTLE 0
#macro MAIN_MENU_DEFEND_old 1 //future crafting
#macro MAIN_MENU_SPECIAL 2
#macro MAIN_MENU_INVENTORY 3

function initializeInventoryAnimations() 
{
	inventoryXAdder = 0;
	inventoryAlpha = 0;
	inventorySwiping = false;

	inventoryFadeIn = function()
	{
		inventoryXAdder += 7;
		inventoryXAdder = clamp(inventoryXAdder, 0, 59);
		inventoryAlpha += 0.05;
		inventoryAlpha = clamp(inventoryAlpha, 0, 1);	
	}

	inventoryFadeOut = function()
	{
		if (inventoryXAdder > 0) { inventoryXAdder -= 5; }
		inventoryXAdder = clamp(inventoryXAdder, 0, 59);
		if (inventoryAlpha > 0) { inventoryAlpha -= 0.05; }
		inventoryAlpha = clamp(inventoryAlpha, 0, 1);		
	}
}
function initializeSubBattleMenuAnimations() 
{
	subMenuSwiping = false;
	subMenuAlpha = 0;
	subMenuXAdder = 0;
	subMenuFadeIn = function(slideIn = true)
	{
		if (slideIn)
		{
			subMenuXAdder += 7;
			subMenuXAdder = clamp(subMenuXAdder, 0, 59);
		}
		subMenuAlpha += 0.05;
		subMenuAlpha = clamp(subMenuAlpha, 0, 1);	
	}

	subMenuFadeOut = function(slideOut = true)
	{
		if (slideOut)
		{
			if (subMenuXAdder > 0) { subMenuXAdder -= 5; }
			subMenuXAdder = clamp(subMenuXAdder, 0, 59);
		}	
		if (subMenuAlpha > 0) { subMenuAlpha -= 0.05; }
		subMenuAlpha = clamp(subMenuAlpha, 0, 1);	
	}	
}

function buildNewMainMenuOptions(_name, _decoSprite, selectFunc, func, fadeInFunc, fadeOutFunc)
{
	return {
		name: _name,
		decoSprite: _decoSprite,
		_selectFunction: selectFunc,
		_function: func,
		_fadeInFunc: fadeInFunc,
		_fadeOutFunc: fadeOutFunc
	}
}

function initializePlayerMainBattleMenuOptions()
{	
	choosing_battle_option = buildNewMainMenuOptions("BATTLE", sAttackDeco, selectedBattleOption, navigatingSubMenuFunction,
			method(self, function() { with (oBattleManager) { if (playingGuiAnimation) { subMenuFadeIn();}}}),
			method(self, function() { with (oBattleManager) { subMenuFadeOut(); }}))

	choosing_inventory_option = buildNewMainMenuOptions("ITEM", sInvDeco, selectedInventoryOption, navigatingInventoryFunction,
			method(self, function() { with (oBattleManager) { if (playingGuiAnimation) { inventoryFadeIn();}}}),
			method(self, function() { with (oBattleManager) { inventoryFadeOut(); }}));

	choosing_cry_option = buildNewMainMenuOptions("CRY", sCryDeco, selectedCryOption, noone, 
			method(self, function() {}),
			method(self, function() {}));

	choosing_heal_option = buildNewMainMenuOptions("HEAL", sHealDeco, selectedHealCheatOption, noone, 
			method(self, function() {}),
			method(self, function() {}));
	
	choosing_pray_option = buildNewMainMenuOptions("PRAY", sPrayDeco, selectedPrayOption, prayOption,
			method(self, function() {}),
			method(self, function() {}));
			
	choosing_enchant_option = buildNewMainMenuOptions("MAGICK", sEnchantDeco, selectedEnchantOption, enchantingOption,
			method(self, function() {}),
			method(self, function() {}));
	
	//The global list of all the options inside the game
	global.mainMenuOptions = {
		choosing_battle_option, 
		choosing_enchant_option,
		choosing_inventory_option,
		choosing_heal_option,
		choosing_pray_option
	};
	
	//The global list of the options the player can use in battle
	global.settedMainBattleOptions[MAIN_MENU_BATTLE] = global.mainMenuOptions.choosing_battle_option;
	global.settedMainBattleOptions[MAIN_MENU_DEFEND_old] = global.mainMenuOptions.choosing_enchant_option;
	global.settedMainBattleOptions[MAIN_MENU_SPECIAL] = global.mainMenuOptions.choosing_pray_option;
	global.settedMainBattleOptions[MAIN_MENU_INVENTORY] = global.mainMenuOptions.choosing_inventory_option;
	
	for (var i = 0; i < array_length(global.settedMainBattleOptions); i++)
	{
		mainOptionsNames[i] = global.settedMainBattleOptions[i].name;
	};
}