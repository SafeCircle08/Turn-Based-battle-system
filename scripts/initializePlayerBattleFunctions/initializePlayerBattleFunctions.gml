//In this script you set up the functions that a specific
//action has.

//To build the actual function go to: 
// define_player_main_actions -> for main actions
// define_player_sub_actions  -> for sub actions

function createAnimationObject(sprite, _messages, _method = function() {})
{
	if (!instance_exists(fadeInOutAnimationsParent))
	{
		var _myEffect = instance_create_layer(0, 0, LAYER_EFFECT, fadeInOutAnimationsParent);
		_myEffect.sprite_index = sprite;
		_myEffect.messages = _messages;
		_myEffect.myMethod = _method;
	}
	return;
}

function initializeNavigatingBattleOptionFunctions()
{
	selectedBattleOption = function() { 
		selectAction(true, true, sndSelecting_2, [],
			method(self, function() { 
				playingGuiAnimation = true;
		}));
	}
	navigatingSubMenuFunction = function(_drawArrow = false)
	{
		showMirrors();
		easeInBg();
	
		//Resets the navigation
		if (keyboard_check_pressed(ord("X"))) { resetNavigation(0); }
	
		var _optionList = global.playerEquippedOptions;
		var _optionNumber = array_length(_optionList);
		var _options = [];
	
		//Draws the secondary options (BUTTONS)
		for (var i = 0; i < _optionNumber; i++)
		{
			//Pushing the right names
			array_push(_options, global.playerEquippedOptions[i].name);
		}
		
		//Select An Action
		battleDelay = setTimer(battleDelay);
		if (battleDelay == 0)
		{
			if (showingSubSubWindow == false)
			{
				navigatingBattle(0, _optionNumber - 1);
				if (keyboard_check_pressed(vk_enter))
				{
					_optionList[selected_option]._selectFunction();
				}
			}
		}
	}
}
function initializeDefend_old_OptionFunction()
{
	selectedDefend_old_Option = function() { selectAction(true, false, sndSelecting_2, ["<>Player defended!", "<>How cool?"]); }	
}
function initialiseCryOptionFunction()
{
	selectedCryOption = function() { selectAction(true, false, sndSelecting_2, ["<>Crying won't do nothing\n  but dehydratate you to death.", "\n<>Stop it."]); }		
}
function initializeInventoryOptionFunctions()
{	
	drawStatistics = function(_index, _itemSprX, _itemSprY, _border) {
		var _item = global.equippedItems[_index];
		for (var k = 0; k < MAX_PROPERTIES_NUMBER; k++)
		{	
			draw_sprite(_item.propertiesList[k], 0, _itemSprX - _border - 1 + inventoryXAdder, _itemSprY + (10 * k + (1 * k)));	
		}	
	}
	drawEnchants = function(_index, _itemSprX, _itemSprY, _border) {
		var _item = global.equippedItems[_index];
		var _enchantsN = array_length(_item.enchants);
		var _itemSprW = sprite_get_width(sBandagesItem);
		for (var k = 0; k < MAX_ENCHANTS_PER_ITEM_NUM; k++) {
			if (k < _enchantsN) {
				setGlintShader();
				draw_sprite(_item.enchants[k][ENCHANT_SPRITE], 0, _itemSprX + _itemSprW + 1 + inventoryXAdder, _itemSprY + (10 * k + (1 * k)));
				shader_reset();
				continue;
			}
			else { 
				draw_sprite(
					sNoEnchants, 0, 
					_itemSprX + _itemSprW + 1 + inventoryXAdder, 
					_itemSprY + (10 * k + (1 * k))
				); 
			}
		}
	}
	
	setEnchantText = function(_index, _col = c_purple) {
		if (selected_option != _index) { draw_set_color(_col); }
		setGlintShader();
	}
	
	thisItemIsSelected = function(_index) {
		return (selected_option == _index) && (!instance_exists(itemOutputMessage)) 	
	}
	
	//Create OutPut Message
	createOutPutMessage = function(_x, _y)
	{
		//Creating the text element that will hold the item output message
		itemOutputMessage = instance_create_depth(_x, _y, 0, oInventoryText);
		itemOutputMessage.actualArray = usingItem(selected_option);
		itemOutputMessage.visible = true;
		itemOutputMessage.textDelay = 30;		
	}
	
	//When you select (press enter)
	selectedInventoryOption = function()
	{
		if (array_length(global.equippedItems) > 0)
		{
			selectAction(true, true, sndOpeningInventory, [], method(self, function() {
				selected_option = 0;
				playingGuiAnimation = true; 
			}));
		}
		else { resetNavigation(3, sndClosingInventory, method(self, function() { moreStepsAct = true; })); }
	}
	navigatingInventoryFunction = function()
	{
		easeInBg();
		//When you decide not to use the inventory
		if (keyboard_check_pressed(ord("X")) && (!instance_exists(itemOutputMessage))) { resetNavigation(3, sndClosingInventory); }
		
		takenOptionDelay = setTimer(takenOptionDelay);
		if (takenOptionDelay == 0)
		{
			var _itemsNumber = array_length(global.equippedItems);
			if (keyboard_check_pressed(ord("V"))) { enchantItem(global.equippedItems[selected_option]); }
			if (keyboard_check_pressed(ord("O"))) { disenchantItem(global.equippedItems[selected_option]); }
			navigatingBattle(0, _itemsNumber - 1); 
			if (keyboard_check_pressed(vk_enter)) 
			{ 
				if (instance_exists(itemOutputMessage)) { 
					instance_destroy(itemOutputMessage);
					terminateAction(["<>Finished using the \n  Inventory."]);
				}
				else {
					var _inventoryX = room_width / 2 - 80 - (59);
					var _inventoryY =  room_width / 2 - 60;
					var _border = 10;
					var _sprBG = sInventoryBG;
					var _bgH = sprite_get_height(_sprBG) * 2;
					createOutPutMessage(_inventoryX + _border + inventoryXAdder,_inventoryY + (_bgH / 2) + _border / 2);
				}
			}
		}
		draw_set_font(fFontino);
	}
}
function initializeHealCheatFunction()
{
	selectedHealCheatOption = function() { terminateAction(["Player healed himself!!!"], method(self, function() { global.playerHP += 1; })) }	
}
function initializeAttackFunctions()
{
	selectedAttackFunction = function() { selectAction(false, false, sndSelecting_2, []) }
	
	attackFunction = function()
	{
		hideMirrors();
		easeInBg(1);
		
		//TIMER DEL PLAYER (PER QUANTI FRAME PUO' ATTACCARE)
		global.playerAttackTime++;
	
		//CREATING THE ATTACK BAR
		var _padX = room_width / 2;
		var _padY = room_width / 2 - 75;
		var eqDrumP = global.eqDrumPad;
		var eqSc = global.eqScope;
		//CREO GLI OGGETTI 
		if (global.playerAttackTime == 1)
		{
			instance_create_layer(_padX, _padY, "Instances", oDrumPadBase);
			instance_create_layer(_padX, _padY, LAYER_BULLETS, eqDrumP);
			instance_create_layer(_padX, _padY, LAYER_SCOPE, eqSc);
		}			
		
		//SE IL PLAYER NON SPARA IN TEMPO
		if (global.playerAttackTime >= global.playerAttackTimer)
		{
			terminateAction(
				global.playerOptions.attack_function._failedAttackFlavourText,
				method(self, function() {
		        oDrumPadObjectsParent.reduceDimensionsAlpha = true;
		        global.playerAttackTime = 0;	
				})
			);
			return;
		}
		else
		{
			if (instance_number(oShell) == 0)
			{
				//TODO:
				/*	
					Da fare che alla fine dei colpi,
					Vengono mostrate degli "attacchi" addosso all'enemy,
					e quando concludono quelle,
					//Il turno del player effettivamente finisce e viene
					mostrato il danno nel player
				*/
				////////
				var _dmg = string(global.eqDrumPad.damage);
				terminateAction(
					global.playerOptions.attack_function._flavourText,
					method(self, function() {
					oDrumPadObjectsParent.reduceDimensionsAlpha = true;
					global.playerAttackTime = 0;
					})
				);
			}
			return;
		}
	}		
}
function initializeUnbindFunctions()
{
	selectedUnbindCage = function() { selectAction(false, false, sndSelecting_2, [], method(self, function() { unbinding = true; instance_destroy(oMirrorTargeting); }))}
	unbindFunction = function() {
		terminateAction(
			global.playerOptions.unbind_function._flavourText,
			method(self, function() {
				global.CSvalue -= 10;	
			})
		);
	}	
}
function initializeDefenceFunctions()
{
	selectedDefenceFunction = function() { selectAction(false, false, sndSelecting_2, [], method(self, function() { hideMirrors(); }))}
	defenceFunction = function() {
		createAnimationObject(sUmbrellaEffectGUI, ["<>You decided to defend!"],
				method(self, function() { defended = true; }));
	}
}
function initializePrayFunctions() 
{
	selectedPrayOption = function() { 
		selectAction(true, true, sndSelecting_2, []); 
		if (!instance_exists(oAdSlidingManager)) {
			var _downAds = instance_create_layer(x, y, layer, oAdSlidingManager);
			_downAds._sign = 1;
			_downAds.createVerticalAds();
			var _upAds = instance_create_layer(x, y, layer, oAdSlidingManager);
			_upAds._sign = -1;
			_upAds.xPos = room_width - (sprite_get_width(sPizzaAd));
			_upAds.createVerticalAds();
		}	
	}
	prayOption = function() { 
		createAnimationObject(sSendYourPrayAnimation_good, [],
		method(self, function() {
			var _possPrayFuncs = [
				function() { 
					var _dmg = irandom_range(20, 167);
					fadeInOutAnimationsParent.messages = 
					["<>Your pray wasn't accepted...", "<>You lost " + string(_dmg) + " HPs..."]; 
					hitPlayer(_dmg);
				},
				function() { 
					var _heal = irandom_range(150, 300);
					fadeInOutAnimationsParent.messages = 
					["<>You decided to pray!", "<>Gained " + string(_heal) + " HPs!"];
					if (global.playerHP + _heal >= global.playerMAX_HP) { 
						array_push(fadeInOutAnimationsParent.messages, "<>HP MAXED OUT!")
					}
					healPlayer(_heal, sndPlayerBasicHeal);
				},
				function() {
					fadeInOutAnimationsParent.messages = addItemToInventory();
				}
			];
			var _index = irandom_range(0, array_length(_possPrayFuncs) - 1);
			var _choosedPrayFunc = _possPrayFuncs[_index];
			_choosedPrayFunc(); 
		}));
	}
}

function initializeEnchantingFunctions()
{
	selectedEnchantOption = function() 
	{
		selectAction(true, true, sndSelecting_2, []);
		if (!instance_exists(oEnchantOptionManager)) { instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oEnchantOptionManager); }  
	}
	
	enchantingOption = function() {
		if (resetKey()) && (oEnchantOptionManager.showingInv == false) { 
			resetNavigation(1); 
			instance_destroy(oEnchantOptionManager);
		}
		
		if (instance_exists(oEnchantOptionManager)) {
			if (resetKey() && (oEnchantOptionManager.showingInv == true)) {
				oEnchantOptionManager.showingInv = false;
				goToPreviousOption(method(self, function() { inventoryXAdder = 0; inventoryAlpha = 0; }))	
			}
		}
		
		takenOptionDelay = setTimer(takenOptionDelay);
		if (takenOptionDelay == 0) {	
			if (pressedEnter()) { 
				takenOptionDelay = 3;
				oEnchantOptionManager.showingInv = !oEnchantOptionManager.showingInv; 
				//code to continue the enchant here
			}
		}
	}
}


function initializeAllCreatedFunctions()
{
	initializeNavigatingBattleOptionFunctions();
	initializeDefend_old_OptionFunction();
	initialiseCryOptionFunction();
	initializeInventoryOptionFunctions();
	initializeHealCheatFunction();
	initializeAttackFunctions();
	initializeUnbindFunctions();
	initializeDefenceFunctions();
	initializePrayFunctions();
	initializeEnchantingFunctions();
}