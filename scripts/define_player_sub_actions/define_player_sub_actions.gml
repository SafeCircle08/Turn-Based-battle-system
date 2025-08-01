function initializePlayerOptionsinfo()
{
	global.playerOptions = {
		attack_function: {
			name: "ATTACK", 
			_selectFunction: selectedAttackFunction,
			_function: attackFunction,
			_flavourText: ["<>The player decided to attack!"],
			_failedAttackFlavourText: ["<>The player has tried to ATTACK..."]
		},
		unbind_function: {
			name: "UNBIND",
			_selectFunction: selectedUnbindCage,
			_function: unbindFunction,
			_flavourText: ["<>The player decidec to UNBIND the cage!"]
		},
		defence_function: {
			name: "DEFEND",
			_selectFunction: selectedDefenceFunction,
			_function: defenceFunction,
			_flavourText: ["<>Player decided to DEFEND!", "<>Damage DECREASED!"]
		},
	}
	
	//Defaul Options
	global.playerEquippedOptions[SUB_MENU_ATTACK] = global.playerOptions.attack_function;
	global.playerEquippedOptions[SUB_MENU_UNBIND] = global.playerOptions.unbind_function;
	global.playerEquippedOptions[SUB_MENU_SPECIAL_OPTION] =  global.playerOptions.defence_function;
}

//Sub menu macros
#macro SUB_MENU_ATTACK 0
#macro SUB_MENU_UNBIND 1
#macro SUB_MENU_SPECIAL_OPTION 2