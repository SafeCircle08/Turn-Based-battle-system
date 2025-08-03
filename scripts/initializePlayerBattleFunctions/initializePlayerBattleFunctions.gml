/* 
	
	SCRIPT USED TO JUST WRITE THE FUNCTIONS NEEDED TO PERFORM A SPECIFIC
	ACTION WANTED.

*/

//MAIN MENU FUNCTIONS INITIALIZATION INFOS
//Default ones
function initializeNavigatingBattleOptionFunctions()
{
	selectedBattleOption = function() { selectAction(true, true, [], method(self, function() { navigatingSubMenu = true; subMenuSwiping = true; })) }	
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
			navigatingBattle(0, _optionNumber - 1);
			if (keyboard_check_pressed(vk_enter))
			{
				//It calles the selectFunction (a set up for the main function)
				switch (selected_option)
				{
					case SUB_MENU_ATTACK:
						_optionList[SUB_MENU_ATTACK]._selectFunction();
					break;
			
					case SUB_MENU_UNBIND:
						_optionList[SUB_MENU_UNBIND]._selectFunction();
					break;
				
					case SUB_MENU_SPECIAL_OPTION:
						_optionList[SUB_MENU_SPECIAL_OPTION]._selectFunction();
					break;
					case 3:
						_optionList[3]._selectFunction();
					break;
					case 4:
						_optionList[4]._selectFunction();
					break;
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
		//Making the item have an effect and removing  
		//it from the inventory
					
	}
	
	//When you select (press enter)
	selectedInventoryOption = function()
	{
		if (array_length(global.equippedItems) > 0)
		{
			selectAction(true, true, [], method(self, function() {
				selected_option = 0;
				navigatingInventory = true;
			}));
		}
		else { resetNavigation(3,method(self, function() { moreStepsAct = true; })); }
	}
	navigatingInventoryFunction = function()
	{
		instance_activate_object(oThinking);
		instance_activate_object(oThinkingAttributes);
		easeInBg();
	
		//When you decide not to use the inventory
		if (keyboard_check_pressed(ord("X")) && (!instance_exists(itemOutputMessage)))
		{
			resetNavigation(
				3,
				method(self, function() {
					instance_deactivate_object(oThinking);
					instance_deactivate_object(oThinkingAttributes);	
				})
			);
		}

		var _itemWidth = sprite_get_width(sItemSprite);
		var _border = 10;
		var _inventoryX = room_width / 2 - 80;
		var _inventoryY =  room_width / 2 - 60;
		
		var _sprBG = sInventoryBG;
		var _bgW = sprite_get_width(_sprBG) * 3;
		var _bgH = sprite_get_height(_sprBG) * 2;

		//Draws the inventory BackGround
		draw_sprite_stretched(_sprBG, 0, _inventoryX, _inventoryY, _bgW, _bgH);
		
		//Draws the Inventory Mini Portrait (can an inventory have a portrait?, Idk lol)
		draw_sprite(sInventoryMiniPortrait, 0, _inventoryX + _bgW - 30, _inventoryY + 3)
		
		//Draws the inventory space (useless but cool)
		draw_set_font(fFontino);
		draw_text(_inventoryX + _border * 3, _inventoryY - _border, string(array_length(global.equippedItems)) + "/8");
		draw_set_font(fGenericText);
		
		//Draws the Item name, properties, info ecc...
		var _spriteBorder = _border - 2;
		var _itemNameX = _inventoryX + _spriteBorder;
		var _itemNameY = _inventoryY + _spriteBorder;
		var j = 0;
		
		for (var i = 0; i < array_length(global.equippedItems); i++)
		{
			if (selected_option == i) && (!instance_exists(itemOutputMessage)) 
			{
				//Sprite
				var _itemSprX = _inventoryX + _bgW - _border - _itemWidth;
				var _itemSprY = _inventoryY + _border + _border / 2 - 2;
				draw_sprite(global.equippedItems[i].sprite, 0, _itemSprX, _itemSprY);
				
				//Draw statistics
				for (var k = 0; k < 3; k++)
				{
					draw_sprite(global.equippedItems[i].propertiesList[k], 0, _itemSprX - _border - 1, _itemSprY + (10 * k + (1 * k)));	
				}
				draw_set_color(c_custom_yellow); 
			}
			else { draw_set_color(c_white); }
			//Left Side
			if (i < 4)
			{
				draw_text_ext_transformed(_itemNameX, _itemNameY + _border * i, ">" + global.equippedItems[i].name, 1, 200, 0.5, 0.5, 0);
				continue;
			}
			//Right Side
			_itemNameX = _inventoryX + _border + string_width("DIVID");
			draw_text_ext_transformed(_itemNameX, _itemNameY + _border * j, ">" + global.equippedItems[i].name, 1, 200, 0.5, 0.5, 0);
			j++;
		}
		
		//Draws the item properties
		if (!instance_exists(itemOutputMessage))
		{	
			 draw_set_color(c_white); 
			//Info
			var _itemInfoBgX = _inventoryX + _border;
			var _itemInfoBgY = _inventoryY + (_bgH / 2);
			
			var _infoBorder = 3;
			var _itemInfoX = _itemInfoBgX - _border / 2;
			var _itemInfoY = _itemInfoBgY - _border / 4 + 1;
			
			var _info = itemInfo(selected_option);
			draw_sprite_stretched(sItemInfoBG, 0, _itemInfoX, _itemInfoY, _bgW - _border, _bgH / 2 + _border / 2 - _border);
			draw_text_ext_transformed(_itemInfoX + _infoBorder * 2,  _itemInfoBgY + _border / 2, _info[0], 20, _bgW + 30, 0.5, 0.5, 0);
		}
		
		//Draws the items statistics book (gonna make it an object in the future)
		//This, when opened, is going to show and describe all the different item 
		//statistics symbols meaning
		var _itemInfoBgY = _inventoryY + (_bgH / 2);
		var _bookW = sprite_get_width(sItemStatisticsBook);
		var _bookX = _inventoryX + _bgW - _bookW - _border;
		var _bookY = _inventoryY + _bgH / 2;
		draw_sprite(sItemStatisticsBook, 0, _bookX, _itemInfoBgY + _border / 2);
		
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
					terminateAction(["Player used an Item!\n>(Super idol!)"]);
				}
				else
				{
					createOutPutMessage(_inventoryX + _border,_inventoryY + (_bgH / 2) + _border / 2);
					array_delete(global.equippedItems, selected_option, 1);
				}
			}
		}
		draw_set_font(fFontino);
	}
}
//Special ones
function initializeHealCheatFunction()
{
	selectedHealCheatOption = function() { terminateAction(["Player healed himself!!!"], method(self, function() { global.playerHP += 1; })) }	
}

//SUB MENU FUNCTION INITIALIZATION INFOS
//Default ones
function initializeAttackFunctions()
{
	selectedAttackFunction = function() { selectAction(false, false, [], method(self, function() { attacking = true; }))}
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
//Special ones
function initializeDefenceFunctions()
{
	selectedDefenceFunction = function() { selectAction(false, false, [], method(self, function() { using_special_action = true; }))}
	defenceFunction = function(messages_list = global.playerOptions.defence_function._flavourText)
	{
		if (!instance_exists(oShieldEffect))
		{
			var _shieldEffect = instance_create_layer(x, y, LAYER_EFFECT, oShieldEffect);
			_shieldEffect.messagesList = messages_list;
		}
		//the terminateFunction() of this function can be found in oShieldEffect
	}		
}