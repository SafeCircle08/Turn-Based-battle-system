/// @description Insert description here
// You can write your code in this editor
// feather disable all

global.enemySeq = layer_sequence_create("Enemy", 101, 41, Sequence1);

a_text[0] = "ATK";
a_text[1] = "DEF";
a_text[2] = "FREE";
a_text[3] = "ITEM";

//BATTLE BOX VARIABLES
global.borderWidth = 100;
global.borderHeight = 100;

//PLAYER VARIABLES
battle = true;
turnNumber = 9;
global.playerName = "Misery";
global.playerMAX_HP = 512;
global.playerHP = 511;
global.playerShield = 50;
global.playerMaxShield = 50;
global.CSvalue = 100;	//CAGE STATE
global.CSvalueMax = 100;
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
global.playerAttackTimer = 300;
global.playerAttackTime = 0;
global.barHit = undefined;
barCreated = false;
attackPressed = false;
attackBGalpha = 0;
canDrawAttackGui = false;
roll = 0;

//BOX VARIABLES and TEXTS
boxWidth = sprite_get_width(sTextBG) + 10;
strHeight = string_height(global.textList[turnNumber]);
charCount = 0;
charCountSupport = 0;
enter = keyboard_check_pressed(vk_enter)
page = 0;
speechSpeed = 0.2;
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

//ENEMY VARIABLES
global.monsterHP = 500;
global.maxMonsterHp = 500;
global.monsterDamage = 1;
global.enemyTimer = 0;

//FUNCTIONS:
attackFunction = function()
{
	//TIMER DEL PLAYER (PER QUANTI FRAME PUO' ATTACCARE)
	global.playerAttackTime++;
	oAttackRoll.visible = true;
		
	//LO SFONDO DIVENTA VISIBILE 
	oAttackBG.image_alpha += 0.05;
		
	//CREATING THE ATTACK BAR
	var _barX = room_width / 2 - 115;
	var _barY = room_width / 2 - 37;
	var _hitX = room_width / 2;
	var _hitY = room_height / 2;

	if (barCreated == false)
	{
		instance_create_layer(_barX, _barY + 12, "Effect", oAttackBar);
		instance_create_layer(_hitX, _hitY, "Effect", oHitPlace);
		barCreated = true;
	}			
		
	//SE IL PLAYER NON CLICCA IN TEMPO 
	if (global.playerAttackTime >= global.playerAttackTimer)
	{
		if (!ds_exists(ds_messages, ds_type_list))
		{
			ds_messages = ds_list_create();	
		}
			
		instance_destroy(oAttackBar);
		attacking = false;
		acting = false;
		ds_messages[| 0] = "The player has TRIED to attacked!"
		oAttackRoll.visible = false;
		showBattleText = true;
		global.playerAttackTime = 0;
	}
		
	with (oAttackBar)
	{
		//SE CLICCHI LA BARRA
		if (keyboard_check_pressed(vk_space)) && (oBattleManager.attackPressed == false)
		{
			//SE SI TROVA NEL POSTO GIUSTO
			if (place_meeting(x, y, oHitPlace))
			{
				global.monsterHP -= 30 + irandom(15);
				hit = true;
				global.playerAttackTime = global.playerAttackTimer - 60;
				oBattleManager.attackPressed = true;
			}
			else
			{
				hit = true;	
				global.playerAttackTime = global.playerAttackTimer - 60
				oBattleManager.attackPressed = true;
			}
		}
	}
}
openingInv = function()
{	
	instance_activate_object(oThinking);
	instance_activate_object(oThinkingAttributes);
	//LO SFONDO DIVENTA VISIBILE 
	oAttackBG.image_alpha += 0.07;
	oAttackBG.image_alpha = clamp(oAttackBG.image_alpha, 0, 0.7);
	
	//When you decide not to use the inventory
	if (keyboard_check_pressed(ord("X")) && (!instance_exists(itemOutput)))
	{
		instance_deactivate_object(oThinking);
		instance_deactivate_object(oThinkingAttributes);
		oAttackBG.image_alpha = 0;
		selected_option = 3;
		invPos = 0;
		acting = false;
		moreStepsAct = false;
		itemOption = false;
		invGUI.visible = false;
		takenOptionDelay = 3;
		itemCordTaken = false;
		itemOptionNav = [];
		turnNumber -= 1;
		audio_play_sound(sndSelecting, 50, false, global.soundGain);
	}

	var _guiX = surface_get_width(application_surface) / 2;
	var _guiY = surface_get_height(application_surface);
	var _spriteWidth = sprite_get_width(sInventory);
	var _spriteHeight = sprite_get_height(sInventory);
	var _itemWidth = sprite_get_width(sItemSprite);
	var _itemHeigth = sprite_get_height(sItemSprite);
	var _actualItemSprite = global.itemSpriteDraw;
	
	draw_sprite_stretched(sInventory, 0, _guiX + 70, _guiY - 280, 240, 250);
	draw_sprite_stretched(_actualItemSprite, 0, _guiX + 200, _guiY - 260, _itemWidth * 3, _itemHeigth * 3 )
	
	if (!instance_exists(itemOutput))
	{	
		var _xx = (surface_get_width(application_surface) / 2) + 85;
		var _yy = (surface_get_height(application_surface) - 250) + 100;
		var _info = itemInfo(invPos);
		draw_text_ext(_xx, _yy, _info, 20, _spriteWidth * 4);
	}
	
	takenOptionDelay = setTimer(takenOptionDelay);
	if (takenOptionDelay == 0)
	{
		if (keyboard_check_pressed(ord("S"))) { invPos += 1; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
		if (keyboard_check_pressed(ord("W"))) { invPos -= 1; 
			audio_play_sound(sndNavigating, 50, false, global.soundGain); }	
		
		//Creating the possible nav pos while using items
		if (itemCordTaken == false)
		{
			var _itemY = surface_get_height(application_surface) - 238
			for (var i = 0; i < array_length(global.items); i++)
			{
				array_push(itemOptionNav, _itemY + 20 * i)
				if (i == array_length(global.items) - 1) { itemCordTaken = true; }
			}
		}
		invPos = clamp(invPos, 0, array_length(global.items) - 1);
		if (drawNav) { draw_sprite(sNav, 0, _guiX + 85, itemOptionNav[invPos]); }
		
		if (keyboard_check_pressed(vk_enter)) 
		{ 
			audio_play_sound(sndSelecting, 50, false, global.soundGain);
			if (instance_exists(itemOutput)) 
			{ 
				instance_destroy(itemOutput);
				invGUI.visible = false;
				takenOptionDelay = 3;
				drawNav = true;
				showBattleText = true;
				itemOption = false;
			}
			else
			{
				//Creating the text element that will hold the item output message
				itemOutput = instance_create_depth(_guiX + 85, _guiY, 0, oText);
				itemOutput.actualArray = usingItem(invPos);
				itemOutput.yAdder = 100
				itemOutput.xAdder = - 10;
				itemOutput.visible = true;
				itemOutput.textDelay = 30;
				drawNav = false;
				//Making the item have an effect and removing  
				//it from the inventory
				array_delete(global.items, invPos, 1);
			}
		}
	}
}