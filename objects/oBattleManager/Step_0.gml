/// @description Insert description here
// You can write your code in this editor
//feather disable all
randomize();


//FASE INIZIALE PARTITA, QUANDO PUOI SCEGLIERE I PULSANTI
if (playerTurn == true) && (showBattleText == false) && (acting == false)
{
	if keyboard_check_pressed(ord("S"))
	{
		if (selected_option == 0) { selected_option = 2; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
		if (selected_option == 1) { selected_option = 3;  audio_play_sound(sndNavigating, 50, false, global.soundGain); }
	}

	if keyboard_check_pressed(ord("W"))
	{
		if (selected_option == 2) { selected_option = 0;  audio_play_sound(sndNavigating, 50, false, global.soundGain); }
		if (selected_option == 3) { selected_option = 1; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
	}
	
	if keyboard_check_pressed(ord("D"))
	{
		if (selected_option == 0) { selected_option = 1; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
		if (selected_option == 2) { selected_option = 3; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
	}

	if keyboard_check_pressed(ord("A"))
	{
		if (selected_option == 1) { selected_option = 0; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
		if (selected_option == 3) { selected_option = 2; audio_play_sound(sndNavigating, 50, false, global.soundGain); }
	}
		
	if keyboard_check_pressed(vk_enter)
	{
		//A NEW TURN STARTS; CHANGE ALL VARIABLES
		//Battle Manager variables
		turnNumber += 1;
		defended = 0;
		enemyTextShowed = false;
		acting = true;

				
		//Generator variables
		oBulletGeneratorManager.generatorCreated = false;
		
		//Player variables
		global.playerShield = global.playerMaxShield;
		oSoul.sprite_index = sPlayerFront;
		oSoul.canShow = true;
		oSoul.coordTimer = 1;
		
		if (!ds_exists(ds_messages, ds_type_list)) { ds_messages = ds_list_create() } 
		
		//---------------------------SELECTING ACTIONS-------------------------
		switch (selected_option)
		{
			case 0:
				moreStepsAct = true;
				choosingBattle = true;
				audio_play_sound(sndSelecting, 50, false);	
			break;
			case 1:
				moreStepsAct = true;
				instance_create_layer(x, y, "Effect", oShieldEffect);
				ds_messages[| 0] = "> Player DEFENDS!";
				ds_messages[| 1] = "> Damage DECREASED!";
				defended = 1;
				audio_play_sound(sndSelecting, 50, false, global.soundGain);
			break;
			case 2:
				moreStepsAct = false;
				ds_messages[| 0] = "> Crying won't solve anything;";
				ds_messages[| 1] = "> Should probably remember this...";
				audio_play_sound(sndSelecting, 50, false, global.soundGain);			
			break;
			case 3:
				if (array_length(global.items) > 0) 
				{ 
					moreStepsAct = true;
					itemOption = true;
					ds_messages[| 0] = "> Player Used an Item!";
					invGUI.visible = true;
					frame += 1;
					audio_play_sound(sndSelecting, 50, false, global.soundGain);
				}
				else
				{
					moreStepsAct = false;
					ds_messages[| 0] = "> You don't have any item...";
					audio_play_sound(sndSelecting, 50, false, global.soundGain);
				}
			break;
		}
		//If an action requires more step, like attacking or 
		//using an item, it won't show the BattleText
		//when you touch enter the first time
		if (moreStepsAct == false) { showBattleText = true; }
	}
}
	
//QUANDO IL TURNO FINISCE E VEDI I MESSAGGI NEL "RIQUADRO" BATTAGLIA
if (showBattleText)
{
	//FA TORNARE "INVISIBILI I BACKGROUNDS"
	if (oBlack.image_alpha > 0) { oBlack.image_alpha -= 0.05; } 
	if (oAttackBG.image_alpha > 0) { oAttackBG.image_alpha -= 0.05; }
	if (oPinkDetails.image_alpha > 0) { oPinkDetails.image_alpha -= 0.05; }
	instance_deactivate_object(oThinking);
	instance_deactivate_object(oThinkingAttributes);
		
	messageTimer++;
		
	if (messageTimer >= timeBeforePressed)
	{
		if (keyboard_check_pressed(vk_enter))
		{
			//APPENA CLICCA IL TESTO SI RESETTA
			//LO STATO DEL PLAYER
			//COSI' PUO' AGIRE NEL PROSSIMO TURNO 
			acting = false;
			if (messageCounter + 1) <= ds_list_size(ds_messages) - 1 { messageCounter++ }
			else
			{
				//FA VISUALIZZARE IL TESTO DELL'ENEMY
				if (enemyTextShowed == false) { enemyCanShowText = true; }
					
				//QUANDO IL TESTO DEL NEMICO E' STATO VISUALIZZATO
				//Code location: oBattleManager.Draw
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

////----------------ATTACK SEQUENCE----------------------
if (acting == true)
{
	if (attacking == true) { attackFunction(global.eqDrumPad, global.eqScope); }
	//if using item: DRAW GUI EVENT
}

//-------------------QUANDO VEDI TUTTI I BULLETS NEL BOX------------------------
if (!playerTurn) && (!showBattleText)
{
	global.playerHP = clamp(global.playerHP, -666, global.playerMAX_HP);
	enemyCanShowText = false;
	global.enemyTimer++; //Parte da 0 e arriva fino a global.enemyAttackTime
	oBattleBox.visible = true;
		
	//QUANDO L'ENEMY FINISCE IL TEMPO A DISPOSIZIONE PER ATTACCARE
	if (global.enemyTimer >= global.enemyAttackTime)
	{
		if (!ds_exists(ds_messages, ds_type_list))
		{
			ds_messages = ds_list_create();	
		}		
		ds_messages[| 0] = "The monster has finished his attack."
		battleOption = 0;
		oBattleBox.visible = false;
		showBattleText = true;
		global.enemyTimer = 0;
		if (instance_exists(oBulletGeneratorParent)) { instance_destroy(oBulletGeneratorParent) }
	}
}