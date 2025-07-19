/* 
	
	SCRIPT USED TO JUST WRITE THE FUNCTIONS NEEDED TO PERFORM A SPECIFIC
	ACTION WANTED.

*/

//MAIN MENU FUNCTIONS INITIALIZATION INFOS
//Default ones
function initializeNavigatingBattleOptionFunctions()
{
	selectedBattleOption = function() { selectAction(true, true, [], method(self, function() { choosingBattle = true; })) }	
	choosingBattleOptions = function(_drawArrow = false)
	{
		showMirrors();
		easeInBg();
	
		//Resets the navigation
		if (keyboard_check_pressed(ord("X"))) { resetNavigation(0); }
	
		if (actualDrawAlpha < 1) { actualDrawAlpha += 0.05; }
		draw_set_alpha(actualDrawAlpha);
	
		//The baseBG coordinates
		var _optionList = global.playerEquippedOptions;
		var _optionNumber = array_length(_optionList);
		var _h = sprite_get_height(sLittleRectangle) / 2;
		var _w = sprite_get_width(sLittleRectangle) / 2;
		var _bgX = room_width / 2 - 30;
		var _bgY = (room_height / 2 - 20) - ((_h * (_optionNumber - 2)) + 5 * (_optionNumber - 2));
		var _bgH = 25;
		var _xBorder = 17;
		var _yBorder = 4;
		//Draws the path arrow
		draw_sprite(sSelectArrow, 0, _bgX - 42, _bgY + (_bgH * _optionNumber) / 2);
		draw_sprite_stretched(sInventory, 0, _bgX, _bgY, 100, _bgH * _optionNumber);
		var _options = [];
	
		//Draws the secondary options (BUTTONS)	
		for (var i = 0; i < _optionNumber; i++)
		{
			//Pushing the right names
			array_push(_options, global.playerEquippedOptions[i].name);
		
			//Draws the buttons and the text
			var _btnX = _bgX + _xBorder;
			var _btnY = _bgY + (_h * i) + _yBorder + 3;
			var _index = 0;
			if (i == battlePos) { _index = 1; } 
			draw_sprite_ext(sLittleRectangle, _index, _btnX,  _btnY, 0.5, 0.5, 0, c_white, 1);
			draw_text(_btnX + _w / 4 - 7, _btnY + _yBorder + 2, _options[i]);
		
			//Takes all the possible positions
			if (array_length(battleOpNav) <= 1) { array_push(battleOpNav, _btnY + _yBorder + 2); }
		}
	
		//Enemy indicating sprite arrow
		if (_optionList[battlePos].name == "ATTACK") { draw_sprite(sIndicatingEnemyArrow, 0, _btnX + 45, _btnY - 75); }
	
		//To prevent to immediatly selecting when the player press enter
		battleDelay = setTimer(battleDelay);
		if (battleDelay == 0)
		{
			if (keyboard_check_pressed(ord("S"))) { battlePos += 1; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
			if (keyboard_check_pressed(ord("W"))) { battlePos -= 1; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
			battlePos = clamp(battlePos, 0, _optionNumber - 1);
		
			//When to draw the arrow
			if (_drawArrow) { draw_sprite(sArrow, 0, _bgX + _xBorder, battleOpNav[battlePos] + 2); }
		
			if (keyboard_check_pressed(vk_enter))
			{
				//It only make the function start;
				//It lasts only one frame;
				//For making function last longer,
				//Use variables inside the function
				switch (battlePos)
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
		draw_set_alpha(1);
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
	selectedInventoryOption = function()
	{
		selectAction(true, true, [], method(self, function() { 
			itemOption = true;
			invGUI.visible = true;
			frame += 1;
		}));
	}
	openingInv = function()
	{
		instance_activate_object(oThinking);
		instance_activate_object(oThinkingAttributes);
		easeInBg();
	
		//When you decide not to use the inventory
		if (keyboard_check_pressed(ord("X")) && (!instance_exists(itemOutput)))
		{
			resetNavigation(
				3,
				method(self, function() {
					instance_deactivate_object(oThinking);
					instance_deactivate_object(oThinkingAttributes);	
				})
			);
		}
	
		var _guiX = room_width / 2 - 90;
		var _guiY = room_width / 2 + 20;
		var _spriteWidth = sprite_get_width(sInventory);
		var _spriteHeight = sprite_get_height(sInventory);
		var _itemWidth = sprite_get_width(sItemSprite);
		var _itemHeigth = sprite_get_height(sItemSprite);
		var _actualItemSprite = global.itemSpriteDraw;
		var _sprBG = sInventory;
		var _bgW = sprite_get_width(_sprBG);
		var _bgH = sprite_get_height(_sprBG);
		var _border = 5;
		draw_set_font(fGenericText);
	
		//Draws the inventory BackGround
		draw_sprite_stretched(sInventory, 0, _guiX, _guiY - 80, _bgW * 3, _bgH * 2);
		draw_sprite_stretched(_actualItemSprite, 0, _guiX + _bgW + 15, _guiY - 75, _itemWidth, _itemHeigth);
	
		//Draws the item properties
		if (!instance_exists(itemOutput))
		{	
			//Draws the selected item's info
			var _xx = _guiX + _border * 2;
			var _yy = _guiY - 30;
			var _info = itemInfo(invPos);
			draw_text_ext_transformed(_xx, _yy, _info, 20, _bgW * 5, 0.5, 0.5, 0);
		}
	
		takenOptionDelay = setTimer(takenOptionDelay);
		if (takenOptionDelay == 0)
		{
			if (keyboard_check_pressed(ord("S"))) { invPos += 1; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
			if (keyboard_check_pressed(ord("W"))) { invPos -= 1; audio_play_sound(sndNavigating, 50, false, global.soundGain); }	
		
			//Creating the possible nav pos while using items
			if (itemCordTaken == false)
			{
				var _itemY = surface_get_height(application_surface) - 238;
				for (var i = 0; i < array_length(global.items); i++)
				{
					array_push(itemOptionNav, _itemY + 20 * i)
					if (i == array_length(global.items) - 1) { itemCordTaken = true; }
				}
			}
			invPos = clamp(invPos, 0, array_length(global.items) - 1);
			if (drawNav) { draw_sprite(sNav, 0, _guiX + 86, itemOptionNav[invPos] - 2); }
		
			if (keyboard_check_pressed(vk_enter)) 
			{ 
				audio_play_sound(sndSelecting, 50, false, global.soundGain);
				if (instance_exists(itemOutput)) 
				{ 
					//Goes to the 'enemy talking section'
					instance_destroy(itemOutput);
					terminateAction(["Player used an Item!\n>(Super idol!)"]);
				}
				else
				{
					//Creating the text element that will hold the item output message
					itemOutput = instance_create_depth(_guiX + 85, _guiY, 0, oText);
					itemOutput.actualArray = usingItem(invPos);
					itemOutput.yAdder = 43;
					itemOutput.xAdder = 0;
					itemOutput.visible = true;
					itemOutput.textDelay = 30;
					drawNav = false;
					//Making the item have an effect and removing  
					//it from the inventory
					array_delete(global.items, invPos, 1);
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
	attackFunction = function(eqDrumP, eqSc)
	{
		hideMirrors();
		easeInBg(1);
	
		//TIMER DEL PLAYER (PER QUANTI FRAME PUO' ATTACCARE)
		global.playerAttackTime++;
	
		//CREATING THE ATTACK BAR
		var _padX = room_width / 2;
		var _padY = room_width / 2 - 75;
	
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
	selectedUnbindCage = function() { selectAction(false, false, [], method(self, function() { unbinding = true; }))}
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