function initializePlayerMainBattleMenuOptions()
{
	global.mainMenuOptions = {
		choosing_battle_option: {
			name: "BATTLE", //The name of the option
			decoSprite: sAttackDeco,
			_selectFunction: selectedBattleOption, //When you press enter
			_function: navigatingSubMenuFunction, //The function you perform afer pressing enter
		},
		choosing_cry_option: {
			name: "CRY",
			decoSprite: sCryDeco,
			_selectFunction: selectedCryOption,	
		},
		choosing_inventory_option: {
			name: "ITEM",
			decoSprite: sInvDeco,
			_selectFunction: selectedInventoryOption,
			_function: navigatingInventoryFunction,
		},
		choosing_healing_option: {
			name: "HEAL",
			decoSprite: sHealDeco,
			_selectFunction: selectedHealCheatOption
		}
	};
	
	//Default options
	global.settedMainBattleOptions[MAIN_MENU_BATTLE] = global.mainMenuOptions.choosing_battle_option;
	global.settedMainBattleOptions[MAIN_MENU_DEFEND_old] = global.mainMenuOptions.choosing_cry_option;
	global.settedMainBattleOptions[MAIN_MENU_SPECIAL] = global.mainMenuOptions.choosing_healing_option;
	global.settedMainBattleOptions[MAIN_MENU_INVENTORY] = global.mainMenuOptions.choosing_inventory_option;
	
	for (var i = 0; i < array_length(global.settedMainBattleOptions); i++)
	{
		mainOptionsNames[i] = global.settedMainBattleOptions[i].name;
	};
}

//Main menu macros
#macro MAIN_MENU_BATTLE 0
#macro MAIN_MENU_DEFEND_old 1 //future crafting
#macro MAIN_MENU_SPECIAL 2
#macro MAIN_MENU_INVENTORY 3