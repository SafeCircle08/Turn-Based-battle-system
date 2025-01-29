/// @description Insert description here
// You can write your code in this editor
//feather disable all

randomize();

if (battle == true)
{
	//FASE INIZIALE PARTITA, QUANDO PUOI SCEGLIERE I PULSANTI
	if (playerTurn == true) && (showBattleText == false) && (attacking == false)
	{
		if keyboard_check_pressed(ord("S"))
		{
			if (selected_option == 0) {selected_option = 2; audio_play_sound(sndNavigating, 50, false); };
			if (selected_option == 1) {selected_option = 3; audio_play_sound(sndNavigating, 50, false); };
		}

		if keyboard_check_pressed(ord("W"))
		{
			if (selected_option == 2) {selected_option = 0; audio_play_sound(sndNavigating, 50, false); };
			if (selected_option == 3) {selected_option = 1; audio_play_sound(sndNavigating, 50, false); };
		}
	
		if keyboard_check_pressed(ord("D"))
		{
			if (selected_option == 0) {selected_option = 1; audio_play_sound(sndNavigating, 50, false); };
			if (selected_option == 2) {selected_option = 3; audio_play_sound(sndNavigating, 50, false); };
		}

		if keyboard_check_pressed(ord("A"))
		{
			if (selected_option == 1) {selected_option = 0; audio_play_sound(sndNavigating, 50, false); };
			if (selected_option == 3) {selected_option = 2; audio_play_sound(sndNavigating, 50, false); }
		}
		
		if keyboard_check_pressed(vk_enter)
		{
		//	if (attacking == false)
		//	{
				//A NEW TURN STARTS; CHANGE ALL VARIABLES
				//Battle Manager variables
				turnNumber += 1;
				textCounter = 0;
				defended = 0;
				enemyTextShowed = false;
				barCreated = false;
				attackPressed = false;
				charCount = 0;
				page = 0;
				//Generator variables
				oBulletGeneratorManager.generatorCreated = false;
				//Player variables
				global.playerShield = global.playerMaxShield;
				oSoul.sprite_index = sPlayerFront;
				oSoul.canShow = true;
				oSoul.coordTimer = 1;
			//}
			
			if (!ds_exists(ds_messages, ds_type_list)) { ds_messages = ds_list_create() } 
		
			//ATTACK
			if (selected_option == 0)
			{		
				attacking = true; 
				ds_messages[| 0] = "Player ATTACKS!";
				battleOption = 0;
				audio_play_sound(sndSelecting, 50, false);
			}
			//DEFENSE
			if (selected_option == 1)
			{
				instance_create_layer(x, y, "Effect", oShieldEffect);
				ds_messages[| 0] = "Player DEFENDS!";
				ds_messages[| 1] = "Damage DECREASED!";
				battleOption = 1;
				defended = 1;
				audio_play_sound(sndSelecting, 50, false);
			}
			//UNBIND
			if (selected_option == 2)
			{	
				instance_create_layer(x, y, "Effect", oFlashEffect);
				ds_messages[| 0] = "Player UNBINDS the CAGE!";
				ds_messages[| 1] = "CS - 10%";
				battleOption = 2;
				global.CSvalue -= 10;
				audio_play_sound(sndSelecting, 50, false);
			}
			//ITEM
			if (selected_option == 3)
			{
				ds_messages[| 0] = "Player USES an ITEM!";
				battleOption = 3;
				audio_play_sound(sndSelecting, 50, false);
			}
			if (selected_option != 0) showBattleText = true;
		}
	}
	
	//QUANDO IL TURNO FINISCE E VEDI I MESSAGGI NEL "RIQUADRO" BATTAGLIA
	if (showBattleText)
	{
		//FA TORNARE "INVISIBILI I BACKGROUNDS"
		if (oBlack.image_alpha > 0) { oBlack.image_alpha -= 0.05; } 
		if (oAttackBG.image_alpha > 0) { oAttackBG.image_alpha -= 0.05; }
		if (oPinkDetails.image_alpha > 0) { oPinkDetails.image_alpha -= 0.05; }
		
		if (instance_exists(oAttackBar)) { instance_destroy(oAttackBar) } 
		
		messageTimer++;
		if (messageTimer >= timeBeforePressed)
		{
			if (keyboard_check_pressed(vk_enter))
			{
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
						//oBattleBox.visible = false;
						if (ds_exists(ds_messages, ds_type_list)) ds_list_destroy(ds_messages);
					}
				}
				messageTimer = 0;
				if (global.playerHP <= 0)  playerDeath = true;
				if (global.monsterHP <= 0) game_restart();
			}
		}	
	}
	if (playerDeath) { battle = false; }
	
	//SHAKE
	if (screenShake == true)
	{
		shakeTimer++;
	
		shakeX = irandom_range(-maxShakeX, maxShakeX);
		shakeY = irandom_range(-maxShakeY, maxShakeY);
	
		if (shakeTimer > timerTillShakeEnds)
		{
			screenShake = false;
			shakeTimer = 0;
			shakeX = 0;
			shakeY = 0;
		}
	}
	
	//ATTACK SEQUENCE
	if (attacking == true)
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
	
	//QUANDO VEDI TUTTI I BULLETS NEL BOX
	if (!playerTurn) && (!showBattleText)
	{
		enemyCanShowText = false;
		global.enemyTimer++; //Parte da 0 e arriva fino a global.enemyAttackTime
		oBattleBox.visible = true;
		global.canDrawGui = false;
		
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
}