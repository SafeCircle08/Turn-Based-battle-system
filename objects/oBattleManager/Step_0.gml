/// @description Insert description here
// You can write your code in this editor
//feather disable all
randomize();

//FASE INIZIALE PARTITA, QUANDO PUOI SCEGLIERE I PULSANTI
if (playerTurn == true) && (showBattleText == false) && (acting == false)
{
	//Menaging the navigation trough the buttons
	navigatingBattle(0, 3);

	if keyboard_check_pressed(vk_enter)
	{
		acting = true;
		enemyTextShowed = false;
		oBulletGeneratorManager.generatorCreated = false; //will create the actual generator
		
		if (!ds_exists(ds_messages, ds_type_list)) { ds_messages = ds_list_create() }
		
		//---------------------------SELECTING MAIN ACTIONS-------------------------
		switch (selected_option)
		{
			case MAIN_MENU_BATTLE:
				global.settedMainBattleOptions[MAIN_MENU_BATTLE]._selectFunction();	
			break;
			case MAIN_MENU_DEFEND_old:
				global.settedMainBattleOptions[MAIN_MENU_DEFEND_old]._selectFunction();
			break;
			case MAIN_MENU_SPECIAL:
				global.settedMainBattleOptions[MAIN_MENU_SPECIAL]._selectFunction();
			break;
			case MAIN_MENU_INVENTORY:
			if (array_length(global.equippedItems) > 0)
			{ 
				global.settedMainBattleOptions[MAIN_MENU_INVENTORY]._selectFunction();
			}
			else { resetNavigation(3,method(self, function() { moreStepsAct = true; })); }
			break;
		}
		//If an action requires more step, like attacking or 
		//using an item, it won't show the BattleText
		//when you touch enter the first time
		if (moreStepsAct == false) { terminateAction(); }
	}
}
	
//WHEN THE TURN ENDS, AND YOU SEE THE DS TEXTS
if (showBattleText)
{
	easeOutBg();
	if (oBlack.image_alpha > 0) { oBlack.image_alpha -= 0.05; } 
	if (oPinkDetails.image_alpha > 0) { oPinkDetails.image_alpha -= 0.05; }
	instance_deactivate_object(oThinking);
	instance_deactivate_object(oThinkingAttributes);
	
	messageTimer++;
		
	if (messageTimer >= timeBeforePressed)
	{
		if (keyboard_check_pressed(vk_enter))
		{
			if (messageCounter + 1) <= ds_list_size(ds_messages) - 1 { messageCounter++ }
			else
			{
				if (enemyTextShowed == false) { enemyCanShowText = true; }
					
				//Goes to PLAYER TURN
				if (enemyTextShowed == true)
				{
					enemyCanShowText = false;
					playerTurn = !playerTurn; 
					showBattleText = false;
					messageCounter = 0;
					if (ds_exists(ds_messages, ds_type_list)) { ds_list_destroy(ds_messages); }
				}
			}
			messageTimer = 0;
			if (global.playerHP <= 0) { game_end(); }
			if (global.monsterHP <= 0) { game_restart(); }
		}
	}	
}

//Performing the options' functions
if (acting == true)
{
	if (attacking == true) { global.playerEquippedOptions[SUB_MENU_ATTACK]._function(global.eqDrumPad, global.eqScope); }
	if (unbinding == true) { global.playerEquippedOptions[SUB_MENU_UNBIND]._function(); }
	if (using_special_action == true) { global.playerEquippedOptions[SUB_MENU_SPECIAL_OPTION]._function(); }
}

//When the player is inside the bullet box
if (!playerTurn) && (!showBattleText)
{
	global.playerHP = clamp(global.playerHP, -666, global.playerMAX_HP);
	enemyCanShowText = false;
	global.enemyTimer++; //Parte da 0 e arriva fino a global.enemyAttackTime
	oBattleBox.visible = true;
	
	//Starts the beam animation 60 frames before the end of the turn
	if (global.enemyTimer == global.enemyAttackTime - 60) { startBeamAnimation(false); }
	
	//At the end of the turn, actually finish it (lmao)
	if (global.enemyTimer >= global.enemyAttackTime)
	{
		finishTurn();
		global.playerShield = global.playerMaxShield;
	}	
}