/// @description Insert description here
// You can write your code in this editor
//feather disable all
randomize();

//FASE INIZIALE PARTITA, QUANDO PUOI SCEGLIERE I PULSANTI
if (playerTurn == true) && (showBattleText == false) && (decidingSubAction == false)
{
	//Menaging the navigation trough the buttons
	navigatingBattle(0, 3);

	if keyboard_check_pressed(vk_enter)
	{
		decidingSubAction = true;
		enemyTextShowed = false;
		oBulletGeneratorManager.generatorCreated = false; //will create the actual generator
		
		if (!ds_exists(ds_messages, ds_type_list)) { ds_messages = ds_list_create() }
		
		//---------------------------SELECTING MAIN ACTIONS-------------------------
		global.settedMainBattleOptions[selected_option]._selectFunction();
		
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
if (decidingSubAction == true)
{
	if (subMenuSwiping) { subMenuFadeIn(); }
	else { subMenuFadeOut(); }
	
	if (actionChoosen) { global.playerEquippedOptions[selected_option]._function(); }
}
else { subMenuFadeOut(); }

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