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
		selectAction(true, true, [], 
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
	selectedDefend_old_Option = function() { selectAction(true, false, ["<>Player defended!", "<>How cool?"]); }	
}
function initialiseCryOptionFunction()
{
	selectedCryOption = function() { selectAction(true, false, ["<>Stop crying baby!"]); }		
}
function initializeInventoryOptionFunctions()
{	
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
			selectAction(true, true, [], method(self, function() {
				selected_option = 0;
				playingGuiAnimation = true; 
			}));
		}
		else { resetNavigation(3, method(self, function() { moreStepsAct = true; })); }
	}
	navigatingInventoryFunction = function()
	{
		easeInBg();
		//When you decide not to use the inventory
		if (keyboard_check_pressed(ord("X")) && (!instance_exists(itemOutputMessage))) { resetNavigation(3); }
		
		takenOptionDelay = setTimer(takenOptionDelay);
		if (takenOptionDelay == 0)
		{
			var _itemsNumber = array_length(global.equippedItems);
			navigatingBattle(0, _itemsNumber - 1);
		
			if (keyboard_check_pressed(vk_enter)) 
			{ 
				audio_play_sound(sndSelecting, 50, false, global.soundGain);
				if (instance_exists(itemOutputMessage)) 
				{ 
					instance_destroy(itemOutputMessage);
					terminateAction(["<>Finished using the \n  Inventory."]);
				}
				else
				{
					var _inventoryX = room_width / 2 - 80 - (59);
					var _inventoryY =  room_width / 2 - 60;
					var _border = 10;
					var _sprBG = sInventoryBG;
					var _bgH = sprite_get_height(_sprBG) * 2;
					createOutPutMessage(_inventoryX + _border + inventoryXAdder,_inventoryY + (_bgH / 2) + _border / 2);
					array_delete(global.equippedItems, selected_option, 1);
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
	selectedAttackFunction = function() { selectAction(false, false, []) }
	
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
			//QUANDO TUTTI I PROIETTILI BUONI FINISCONO
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
	selectedUnbindCage = function() { selectAction(false, false, [], method(self, function() { unbinding = true; instance_destroy(oMirrorTargeting); }))}
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
	selectedDefenceFunction = function() { selectAction(false, false, [], method(self, function() { hideMirrors(); }))}
	defenceFunction = function() {
		createAnimationObject(sUmbrellaEffectGUI, ["<>You decided to defend!"],
				method(self, function() { defended = true; }));
	}
}
function initializePrayFunctions() 
{
	selectedPrayOption = function() { selectAction(true, true, []) }
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
					healPlayer(_heal);
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
	initializePrayFunctions()
}