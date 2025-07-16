/// @description Insert description here
// You can write your code in this editor
// feather disable all

global.enemySeq = layer_sequence_create("Enemy", 101, 41, Sequence1);

a_text[0] = "BATTLE";
a_text[1] = "DEF";
a_text[2] = "CRY";
a_text[3] = "ITEM";

//BATTLE BOX VARIABLES
global.borderWidth = 100;
global.borderHeight = 100;

//PLAYER VARIABLES
battle = true;
turnNumber = 15;
defended = false;
playerDeath = false;
playerTurn = true;

//GENERALE ACT VARIABLES
moreStepsAct = false; //if an action requires more steps
acting = false;
selected_option = 0;

shieldBarW = 121;
hpbarW = 121;

//ATTACK FUNCTION VARIABLES
attacking = false;

//BOX VARIABLES and TEXTS
boxWidth = sprite_get_width(sTextBG) + 10;
strHeight = string_height(global.textList[turnNumber]);
charCount = 0;
enter = keyboard_check_pressed(vk_enter);
page = 0;
speechSpeed = 0.5;
ds_messages = ds_list_create();
messageCounter = 0;
showBattleText = false;
messageTimer = 0;
timeBeforePressed = 15;
enemyTextShowed = false;
enemyCanShowText = 0;
textSkipTimer = 100;
color = c_white;
dialogueDelay = 10;
lastSpace = 0;

//BUTTONS VARIABLES
startButtonXRef = -200;
startButtonX = startButtonXRef;
buttonFrame = 0;
btTextWrote = false;
btCharCount = 0;

//INVENTORY VARIABLES
frame = -1;
invGUI = undefined;
itemOptionNav = []; //the position to navigate in the inventory
takenOptionDelay = 3;
itemOutput = undefined;
maxOption = undefined;
itemCordTaken = false;
drawNav = true;
itemOption = false; //if you decided to use the item act
invPos = 0; //the pos your cursor is in the inventory

//BATTLE OPTIONS VARIABLES
battlePos = 0;
battleOpNav = [];
choosingBattle = false;
battleDelay = 3;
actualDrawAlpha = 0;
defending = false;

//FUNCTIONS:
selectedAttackFunction = function() 
{ 
	chooseAction(method(self, function() { attacking = true; })); 
}
selectedDefenceOption = function()
{ 
	chooseAction(method(self, function() { defending = true; })); 
}

selectedUnbindCage = function()
{
	terminateAction(
		[choosingBattle],
		["> Player UNBINDS the CAGE!", "> CS - 10%"],
		method(self, function() {
			moreStepsAct = false;
			instance_create_layer(x, y, LAYER_EFFECT, oFlashEffect);
			global.CSvalue -= 10;
		})
	)
	audio_play_sound(sndSelecting, 50, false, global.soundGain);		
}

defendFunction = function()
{
	/*THE TERMINATE FUNCTION CAN BE 
	FOUND INTO THE OSHIELDEFFECT*/
	choosingBattle = false;
	if (!instance_exists(oShieldEffect))
	{
		instance_create_layer(x, y, LAYER_EFFECT, oShieldEffect);
	}
}
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
			[attacking], 
			["The player has tried to attack!"],
			method(self, function() {
				attacking = false;
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
				[attacking], 
				["> The player has finished his attack!\n> Damage dealt: " + _dmg + "!"],
				method(self, function() {
					attacking = false;
					oDrumPadObjectsParent.reduceDimensionsAlpha = true;
					global.playerAttackTime = 0;
				})
			);
		}
		return;
	}
}
choosingBattleOptions = function(_optionList, _drawArrow = false)
{
	showMirrors();
	easeInBg();
	
	//Resets the navigation
	if (keyboard_check_pressed(ord("X")))
	{
		resetNavigation(0);
		oAttackBG.fadingOut = true;
		choosingBattle = false;
	}
	
	if (actualDrawAlpha < 1) { actualDrawAlpha += 0.05; }
	draw_set_alpha(actualDrawAlpha);
	
	//The baseBG coordinates
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
	var _options = ["ATTACK", "UNBIND", "DEFEND"];
	
	//Draws the secondary options (BUTTONS)	
	for (var i = 0; i < _optionNumber; i++)
	{
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
	if (battlePos == 0) { draw_sprite(sIndicatingEnemyArrow, 0, _btnX + 45, _btnY - 75); }
	
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
				case 0:
					_optionList[0]();
				break;
			
				case 1:
					_optionList[1]();
				break;
				
				case 2:
					_optionList[2]();
				break;
				case 3:
				
				break;
			}
		}
	}
	draw_set_alpha(1);
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
				oAttackBG.fadingOut = true;
				invPos = 0;
				itemOption = false;
				invGUI.visible = false;
				takenOptionDelay = 3;
				itemCordTaken = false;
				itemOptionNav = [];
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
				terminateAction(
					[itemOption],
					["Player used an Item!\n>(Super idol!)"],
					method(self, function() {
						itemOption = false;
						invGUI.visible = false;
						drawNav = true;
					})
				);
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