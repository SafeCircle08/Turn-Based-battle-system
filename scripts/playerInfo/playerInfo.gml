//General info:
global.playerName = "Misery";
global.playerMAX_HP = 512;
global.playerHP = 511;
global.playerShield = 50;
global.playerMaxShield = 50;
global.CSvalue = 100;	//CAGE STATE
global.CSvalueMax = 100;
global.playerAttackTimer = 300; //5 seconds
global.playerAttackTime = 0;
	
//----------------------------VARIABILI GLOBALI---------------------------------------------------
global.SoulSpeed = 2;
global.defenceValue = undefined;
global.attackRandom = undefined; //VALORE AGGIUNTIVO A GLOBAL.BULLETATK (RENDERE I DANNI VARIABILI)
//Variabili per spostare il player 
//(non farlo spawnare sempre al centro del box)
global.xOffset = 0;
global.yOffset = 0;
global.playerMoveTimer = 65;
global.beamAnimation = false;	
	
//Weapons Info:	
global.eqDrumPad = oDrumPad;
global.eqScope = oDrumPadScope;

//Main menu macros
#macro MAIN_MENU_BATTLE 0
#macro MAIN_MENU_DEFEND_old 1 //future crafting
#macro MAIN_MENU_SPECIAL 2
#macro MAIN_MENU_INVENTORY 3
//Sub menu macros
#macro SUB_MENU_ATTACK 0
#macro SUB_MENU_UNBIND 1
#macro SUB_MENU_SPECIAL_OPTION 2

/*
	DATA SCTRUCTURE USED TO CREATE NEW OPTIONS BY PUTTING INSIDE THEM
	NEW FUNCTIONS.
*/

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

//The options the player can take, that will
//call their function if needed
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