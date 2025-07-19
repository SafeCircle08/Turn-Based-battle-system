if (oBattleBox.visible == false)
{
	//Variables
	var guiX = room_width / 2;
	var guiY = room_height;
	var _border = 10;
	var _sprTextBox = sNewBox;
	var _textBoxW = sprite_get_width(_sprTextBox);
	var _textBoxH = sprite_get_height(_sprTextBox);
	var _battleFont = fFontino;
	var fontSize = font_get_size(_battleFont);
	var	BUFFER = 12;
	draw_set_font(_battleFont);
	
	//Draws the text box and the battle messages
	draw_sprite(_sprTextBox, 0, guiX, guiY);
	if (showBattleText)
	{
		var _textX = guiX - (_textBoxW / 2) + BUFFER;
		var _textY = guiY - (_textBoxH + BUFFER);
		for (var a = 0; a <= messageCounter; a++)
		{
			draw_text_ext(_textX + BUFFER, _textY + BUFFER + fontSize * a * 2 + 25, ds_messages[| a], (fontSize + BUFFER), _textBoxW - BUFFER * 3);
		}
	}
	
	//Draws the player variables
	var _playerInfoX = BUFFER - 5;
	var _playerInfoY = guiY - (_textBoxH) + 2;
	
	//Hp
	draw_text(_playerInfoX, _playerInfoY, "HP:" + string(global.playerHP) + "/" + string(global.playerMAX_HP) + ";");
	
	//Cage State
	var _csX = _playerInfoX + (10 * BUFFER) - 20;
	var _barCsW = 121;
	var _barCsH = 10;
	draw_text(_csX, _playerInfoY, "CS: ");
	draw_sprite(sCSBarBG, 0, _csX + 25, _playerInfoY);
	draw_sprite_stretched(sCSBar, 0, _csX + 25, _playerInfoY, (global.CSvalue/global.CSvalueMax) * _barCsW, _barCsH);
	
	//Draws the monster variables
	var _enemyInfoX = _csX + 120;
	var _enemyInfoY = _playerInfoY + 5;
	draw_set_color(c_red);
	draw_text_ext_transformed(_enemyInfoX + 40, _enemyInfoY, "(" + string(global.monsterHP) + "/" + string(global.maxMonsterHp) + ")", 5, 100, 0.5, 0.5, 0);
	draw_set_color(c_white);
	
	//Draws the button section
	var _buttonY = room_height / 4;
	var _goalButtonX = 2;
	
	var _sprButton = sLittleRectangle;
	var _buttonW = sprite_get_width(_sprButton);
	var _buttonH = sprite_get_height(_sprButton);
	
	//Button BG
	draw_sprite_stretched(sInventory, 0, startButtonX - 50, _buttonY - 5, _buttonW / 2 + 70, _buttonH * 2 + 15);
	//Mini player portrait
	draw_sprite_ext(sPlayerMiniPortrait, 0, startButtonX + 40, _buttonY - 2, 1, 1, 0, c_white, 1);
	
	if (!showBattleText)
	{
		//Increase the buttons position
		if (startButtonX < _goalButtonX)
		{
			buttonFrame += 0.05;
			startButtonX += 10 * buttonFrame;
		}
		startButtonX = clamp(startButtonX, -200, _goalButtonX);
		
		for (var i = 0; i < array_length(a_text); i++)
		{
			//Draws the button
			var _index = 0;
			var _xBufferFirst = 160;
			if (selected_option == i) { _index = 1 };
			draw_sprite_ext(sLittleRectangle, _index, startButtonX, _buttonY + 21 * i, 0.5, 0.5, 0, c_white, 1);
		
			//Draw the action on the button			
			var text = a_text[i];
			draw_text(startButtonX + 10, (_buttonY + 5) + (_buttonH / 2 + 1) * i, text);
		}
		//TO CHANGE
		var _textList = ["<> It's like the surrounding heat\n   is taking your breath\n   away...", "<> You should probably find a way\n   to finish all of this..."];
		drawFreeText_battle(_textList);
		
	}
	else
	{
		if (startButtonX > startButtonXRef)
		{
			startButtonX -= 5;
			startButtonX = clamp(startButtonX, -200, 100);
		}			
	}
	
	//Drawing the sub options the player can take
	if (acting == true)
	{
		if (itemOption == true) { global.mainMenuOptions.choosing_inventory_option._function(); }	
		if (choosingBattle == true)
		{ 
			//global.mainMenuOptions.choosing_battle_option._function();
			choosingBattleOptions(); 
		}
	}
}
else
{
	//DRAWS THE PLAYER HEALTH AND SHIELD BARS
	var _bX = 10; 
	var _bY = room_height - 15;
	var _bH = 8;
	var _bW = 145.5;
	var _xOffSet = 3;
	var _yOffSet = 2.5;
	var rectH = 13;
	
	draw_sprite_stretched(sWhiteRectangle, 0, _bX, _bY, 300, rectH);
	
	draw_sprite_stretched(sHealthBar, 0, _bX + _xOffSet, _bY + _yOffSet, (global.playerHP/global.playerMAX_HP) * _bW, _bH);
	draw_sprite_stretched(sShieldBar, 0, _bX + _bW + (_xOffSet * 2), _bY + _yOffSet, (global.playerShield/global.playerMaxShield) * _bW, _bH);
	
	var _font = fGenericText;
	draw_set_font(_font);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	
	draw_text_ext_transformed(_bX + _xOffSet + (_bW / 2) - 5, _bY - 11, "HP: " + string(global.playerHP) + " / " + string(global.playerMAX_HP) + ";", 3, 9999, 0.5, 0.5, 0);
		
	draw_set_halign(fa_left);
}

if (enemyCanShowText) && (enemyTextShowed == false)
{
	var _border = 7;
	var _xSep = 17;
	var _ySep = 5;	
	var _lSep = 17;
	var _x = 200;
	var _y = 50;
	var _page = global.textList[turnNumber];
	
	draw_sprite(sTextBG, 0, _x, _y);
	draw_set_font(fFontino);
	draw_set_color(c_white);
	
	//IL TESTO VIENE MOSTRATO SUBITO E SI PUO' SKIPPARE SUBITO
	if keyboard_check_pressed(ord("X")) { charCount = string_length(_page[page]); }
	
	dialogueDelay = setTimer(dialogueDelay);
	if (dialogueDelay == 0) && (charCount < string_length(_page[page])) 
	{
		charCount += speechSpeed; 
		if (string_char_at(_page[page], charCount) == "." || string_char_at(_page[page], charCount) == "?" || string_char_at(_page[page], charCount) == "!") 
		{
			dialogueDelay = 15;
		}
		if (string_char_at(_page[page], charCount) == ",")
		{
			dialogueDelay = 7;
		}
	}

	//FA PROGREDIRE IL TESTO LETTERA PER LETTERA	
	var _bgH = sprite_get_height(sTextBG) / 2;
	var _textPart = string_copy(_page[page], 1, charCount);
	var _col = make_color_rgb(0, 42, 127);
	draw_set_color(_col);
	draw_text_ext_transformed(_x + _border + 0.5 , _y - _bgH + _border + 0.5, _textPart, _lSep, boxWidth + 70, 0.5, 0.5, 0);	
	draw_set_color(c_white);
	draw_text_ext_transformed(_x + _border , _y - _bgH + _border, _textPart, _lSep, boxWidth + 70, 0.5, 0.5, 0);	

	//SE PUOI EFFETTIVAMENTE SKIPPARE
	if keyboard_check_pressed(vk_enter) && (charCount >= string_length(_page[page]))
	{
		if (page + 1 < array_length(_page))
		{
			page++;
			charCount = 0;				
		}
		else 
		{
			enemyTextShowed = true; 
			charCount = 0;
			page = 0;
			speechSpeed = 0.5;
		}  
	}
}
draw_set_color(c_white);
draw_set_font(fGenericText);