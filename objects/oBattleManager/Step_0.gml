//feather disable all
randomize();

if (playerMainActionTurn())
{
	navigatingBattle(0, 3);
	if keyboard_check_pressed(vk_enter)
	{
		decidingSubAction = true;
		oBulletGeneratorManager.generatorCreated = false;
		
		if (!ds_exists(ds_messages, ds_type_list)) { ds_messages = ds_list_create() }
		
		mainPressed = selected_option;
		global.settedMainBattleOptions[selected_option]._selectFunction();
	
		if (moreStepsAct == false) { terminateAction(); }
	}
}

if (showBattleText)
{
	easeOutBg();
	if (oBlack.image_alpha > 0) { oBlack.image_alpha -= 0.05; } 
	if (oPinkDetails.image_alpha > 0) { oPinkDetails.image_alpha -= 0.05; }
	
	messageTimer++;
	
	if (messageTimer >= timeBeforePressed)
	{
		if (keyboard_check_pressed(vk_enter))
		{
			if (messageCounter + 1) <= ds_list_size(ds_messages) - 1 { messageCounter++ }
			else
			{
				if (enemyTextShowed == false) { enemyCanShowText = true; }
				if (enemyTextShowed == true) { changeTurn(); }
			}
			messageTimer = 0;
			if (global.playerHP <= 0) { game_end(); }
			if (global.monsterHP <= 0) { game_restart(); }
		}
	}
}

//Navigating sub actions windows (ex. inventory menu or battle sub menu)
if (decidingSubAction == true)
{	
	if (playingGuiAnimation) 
	{ 
		global.settedMainBattleOptions[mainPressed]._fadeInFunc(); 
	} else { global.settedMainBattleOptions[mainPressed]._fadeOutFunc(); }
	
	if (showingSubWindow) { global.settedMainBattleOptions[mainPressed]._function(); }
	if (actionChoosen) { global.playerEquippedOptions[selected_option]._function(); }	
}
else { global.settedMainBattleOptions[mainPressed]._fadeOutFunc(); }

if (isNotPlayerTurn())
{
	global.playerHP = clamp(global.playerHP, -666, global.playerMAX_HP);
	global.enemyTimer++; //0 -> global.enemyAttackTime
	if (global.enemyTimer == global.enemyAttackTime - 60) { startBeamAnimation(false); }
	if (global.enemyTimer >= global.enemyAttackTime) { finishTurn(); }
}