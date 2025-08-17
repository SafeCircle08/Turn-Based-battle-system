if (!isInBulletHellSection())
{
	#region //VARIABLES
	var guiX = room_width / 2;
	var guiY = room_height;
	var _sprTextBox = sNewBox;
	var _textBoxW = sprite_get_width(_sprTextBox);
	var _textBoxH = sprite_get_height(_sprTextBox);
	var _battleFont = fFontino;
	var fontSize = font_get_size(_battleFont);
	var	BUFFER = 12;
	draw_set_font(_battleFont);
	#endregion
	
	#region DRAWING DS MESSAGES
	var _dsBgW = sprite_get_width(_sprTextBox);
	var _dsBgH = sprite_get_height(_sprTextBox);
	var _dsX = camera_get_view_x(view_camera[view_current]);
	var _dsY = camera_get_view_height(view_camera[view_current]);
	var _border = 10;
	
	if (showBattleText)
	{
		//Draws the text box and the battle messages
		var dsBoxX = camera_get_view_x(view_camera[view_current]) + sprite_get_width(sNewBox) / 2;
		var dsBoxY = camera_get_view_height(view_camera[view_current]);
		draw_sprite(_sprTextBox, 0, dsBoxX, dsBoxY);
		var _textX = guiX - (_textBoxW / 2) + BUFFER;
		var _textY = _dsY - _dsBgH + 13;
		for (var a = 0; a <= messageCounter; a++)
		{
			draw_set_color(c_gray);
			draw_text_ext(_dsX + _border + 0.5, _textY + fontSize * a * 2 + 2.5, ds_messages[| a], fontSize + 9, _textBoxW - BUFFER * 3);
			draw_set_color(c_white);
			draw_text_ext(_dsX + _border, _textY + fontSize * a * 2 + 2, ds_messages[| a], fontSize + 9, _textBoxW - BUFFER * 3);
		}	
	}
	#endregion
	
	#region DRAWING PLAYER HP, CAGE STATE
	//Draws the player variables
	var _playerInfoX = BUFFER - 5;
	var _playerInfoY = guiY - (_textBoxH) - 7;
	
	//Hp
	draw_text(_playerInfoX, _playerInfoY, "HP:" + string(global.playerHP) + "/" + string(global.playerMAX_HP) + ";");
	
	//Cage State
	var _csX = _playerInfoX + (10 * BUFFER) - 20;
	var _barCsW = 121;
	var _barCsH = 10;
	draw_text(_csX, _playerInfoY, "CS: ");
	draw_sprite(sCSBarBG, 0, _csX + 25, _playerInfoY - 1);
	draw_sprite_stretched(sCSBar, 0, _csX + 25, _playerInfoY - 1, (global.CSvalue/global.CSvalueMax) * _barCsW, _barCsH);
	#endregion
	
	#region DRAWING ENEMY INFO
	//Draws the monster variables
	var _enemyInfoX = _csX + 60;
	var _enemyInfoY = _playerInfoY + 5;
	draw_set_color(c_red);
	draw_text_ext_transformed(_enemyInfoX + 40, _enemyInfoY, "(" + string(global.monsterHP) + "/" + string(global.maxMonsterHp) + ")", 5, 100, 0.5, 0.5, 0);
	draw_set_color(c_white);
	#endregion
	
	#region DRAWING SUB MENU 
	var _optionList = global.playerEquippedOptions;
	var _optionNumber = array_length(_optionList);
	var _h = sprite_get_height(sLittleRectangle) / 2;
	var _w = sprite_get_width(sLittleRectangle) / 2;
		
	//Sub Menu Button Pos
	setSubMenuPositions(
		(room_width / 2) - 48, 
		(room_height / 2 - 20) - ((_h * (_optionNumber - 2)) + 5 * (_optionNumber - 2)) - 5
	);
	
	var _bgH = 25;
	var _xBorder = 17;
	var _yBorder = 4;
	var _bgW = 80;
	var _buttonY = room_height / 4 - 12;
	var _goalButtonX = 0;
	var _sprButton = sLittleRectangle;
	var _buttonW = sprite_get_width(_sprButton);
	var _buttonH = sprite_get_height(_sprButton);
		
	if (subMenuAlpha > 0)
	{
		drawFadeInSprite(sSelectArrow, subMenuX - 49, subMenuY + (_bgH * _optionNumber) / 2, subMenuAlpha, subMenuXAdder);
		drawFadeInSpriteStretched(sInventory, subMenuX - 49, subMenuY, subMenuAlpha, subMenuXAdder, _bgW, _bgH * _optionNumber);
		drawFadeInSprite(sSteamPunkMiniPortrait, subMenuX - 49 + _bgW / 2, subMenuY + 3, subMenuAlpha, subMenuXAdder);	
		var _options = [];
	
		draw_set_alpha(subMenuAlpha);
		//Draws the secondary options (BUTTONS)
		for (var i = 0; i < _optionNumber; i++)
		{
			//Pushing the right names
			array_push(_options, global.playerEquippedOptions[i].name);
			//Draws the buttons and the text
			var _btnX = subMenuX + _xBorder - 58;
			var _btnY = subMenuY + (_h * i + 1 * i) + _yBorder + 2;
			var _index = 0;
			if (i == selected_option) { _index = 1; } 
			draw_sprite_ext(sGUIBattleButton, _index, _btnX + subMenuXAdder, _btnY, 1, 1, 0, c_white, subMenuAlpha);
			draw_text(_btnX + _w / 4 - 7 + subMenuXAdder, _btnY + _yBorder + 2, _options[i]);
		}
		draw_set_alpha(1);
	}
	#endregion
	
	#region DRAWING MAIN MENU
	//Button BG
	draw_sprite_stretched(sInventory, 0, startButtonX - 50, _buttonY - 5, _buttonW / 2 + 71.5, _buttonH * 2 + 15);
	//Mini player portrait
	draw_sprite_ext(sPlayerMiniPortrait, 0, startButtonX + 40, _buttonY - 2, 1, 1, 0, c_white, 1);
	
	if (!showBattleText)
	{
		increaseMainMenuXPos();	
		for (var i = 0; i < array_length(mainOptionsNames); i++)
		{
			//Draws the button
			var _index = 0;
			if (decidingSubAction == false)
			{
				if (selected_option == i) { _index = 1 };
			}
			var _y = _buttonY + 21 * i;
			var _x = startButtonX;
			
			//Actual button
			draw_sprite(sGUIBattleButton, _index, _x, _y);
			
			//Button Properties (name, deco, ecc...)		
			var text = global.settedMainBattleOptions[i].name;
			draw_sprite(global.settedMainBattleOptions[i].decoSprite, _index, _x + 66, _y + 2)
			var textX = startButtonX + 10;
			var textY = (_buttonY + 5) + (_buttonH / 2 + 1) * i + 0.5;
			draw_text(textX, textY, text);
		}
		//TO CHANGE
		var _textList = ["<>It's like the surrounding heat\n  is taking your breath away...", "<>You should probably find a way\n  to finish all of this...\n<>And get some water :>"];
		drawFreeText_battle(_textList);
	}
	else { decreaseMainMenuXPos(); }
	#endregion
	
	#region	DRAWING THE INVENTORY
	
	if (inventoryAlpha > 0 )
	{
		draw_set_alpha(inventoryAlpha);
		
		var _itemWidth = sprite_get_width(sItemSprite);
		var _border = 10;
		var _inventoryX = room_width / 2 - 80 - (59);
		var _inventoryY =  room_width / 2 - 55;
		
		var _sprBG = sInventoryBG;
		var _bgW = sprite_get_width(_sprBG) * 3;
		var _bgH = sprite_get_height(_sprBG) * 2;

		//Draws the inventory BackGround
		draw_sprite_stretched(_sprBG, 0, _inventoryX + inventoryXAdder, _inventoryY, _bgW, _bgH);
		
		//Draws the Inventory Mini Portrait (can an inventory have a portrait?, Idk lol)
		draw_sprite(sInventoryMiniPortrait, 0, _inventoryX + _bgW - 30 + inventoryXAdder, _inventoryY + 3)
		
		//Draws the inventory space (useless but cool)
		draw_set_font(fFontino);
		var _invCapacity = string(array_length(global.equippedItems)) + "/" + string(MAX_ITEMS_NUM);
		draw_text(_inventoryX + _border * 3 + inventoryXAdder, _inventoryY - _border, _invCapacity);
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
				draw_sprite(global.equippedItems[i].sprite, 0, _itemSprX + inventoryXAdder, _itemSprY);
				
				//Draw statistics
				for (var k = 0; k < 3; k++)
				{
					//print(global.equippedItems[i].propertiesList);
					draw_sprite(global.equippedItems[i].propertiesList[k], 0, _itemSprX - _border - 1 + inventoryXAdder, _itemSprY + (10 * k + (1 * k)));	
				}
				draw_set_color(c_custom_yellow); 
			}
			else { draw_set_color(c_white); }
			//Left Side
			if (i < 4)
			{
				draw_text_ext_transformed(_itemNameX + inventoryXAdder, _itemNameY + _border * i, global.equippedItems[i].name, 1, 200, 0.5, 0.5, 0);
				continue;
			}
			//Right Side
			_itemNameX = _inventoryX + _border + string_width("DIVI");
			draw_text_ext_transformed(_itemNameX + inventoryXAdder, _itemNameY + _border * j, global.equippedItems[i].name, 1, 200, 0.5, 0.5, 0);
			j++;
		}
		
		var _itemInfoBgX = _inventoryX + _border;
		var _itemInfoBgY = _inventoryY + (_bgH / 2);	
		var _infoBorder = 3;
		var _itemInfoX = _itemInfoBgX - _border / 2;
		var _itemInfoY = _itemInfoBgY - _border / 4 + 1;
		
		draw_sprite_stretched(sItemInfoBG, 0, _itemInfoX + inventoryXAdder, _itemInfoY, _bgW - _border, _bgH / 2 + _border / 2 - _border);
		
		//Draws the item properties
		if (!instance_exists(itemOutputMessage))
		{	
			draw_set_color(c_white);
			var _info = itemInfo(selected_option);
			draw_text_ext_transformed(_itemInfoX + _infoBorder * 2 + inventoryXAdder,  _itemInfoBgY + _border / 2, _info[0], 20, _bgW + 30, 0.5, 0.5, 0);
		}
		
		//Draws the items statistics book (gonna make it an object in the future)
		//This, when opened, is going to show and describe all the different item 
		//statistics symbols meaning
		var _itemInfoBgY = _inventoryY + (_bgH / 2);
		var _bookW = sprite_get_width(sItemStatisticsBook);
		var _bookH = sprite_get_height(sItemStatisticsBook);
		var _bookX = _inventoryX + _bgW - _bookW - _border;
		var _bookY = _inventoryY + _bgH / 2;
		var _bookSubImg = 0;
		
		if (mouse_x > _bookX + inventoryXAdder && mouse_x < _bookX + inventoryXAdder + _bookW) &&
		   (mouse_y > _bookY && mouse_y < _bookY + _bookH)
		{
			_bookSubImg = 1;
			if (mouse_check_button_pressed(mb_left))
			{
				if (!instance_exists(oBattleInvBookManager)) { openBattleBook(); }
				else {
					oBattleInvBookManager.fadeInDone = true;
					oBattleInvBookManager.fadingOut = true;	
				}
			}
		}
		
		
		/*
		
		//Book object
		
		global.healProperties = {
			propertiesList: [sDoubleHeal, sHeal...];
		}
		
		Draw:
		
		draw_sprite(itemBookBg, bgX, bgY);
		
		propertiesKind = [
			global.healProp,
			...
			...
		]
		
		for (var i = 0; i < length(propertiesKind); i++)
		{
			for (var j = 0; j < propertiesKind[i].propertiesList; j++) {
				draw_sprite(propertiesKind[i].propertiesList[j][PROPERTY_INFO_SPR], _pX, _pY);	
				draw_text(propertiesKind[i].propertiesList[j][PROPERY_INFO_DESC], _px, _pY + 20);
			}
		}
		
		//
		
		function openBook()
		{
			if (!instance_exist(oBattleItemBook)) {
				instance_create(oBattleItemBook);
			}
		}
		
		if (mouse_hover on book sprite || instance_exist(oBattleItemBook)) {
			sBookSubImg = 1;
			if (mb_left) {
				openBook();
			}
		}
		*/
		
		draw_sprite(sItemStatisticsBook, _bookSubImg, _bookX + inventoryXAdder, _itemInfoBgY + _border / 2);
		draw_set_alpha(1);
	}
	#endregion
}
else
{
	#region DRAWING PLAYER INFO DURING TURN
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
	#endregion
}

if (isEnemySpeaking())
{
	var _xSep = 17;
	var _ySep = 5;	
	var _lSep = 17;

	//Text BG coords
	var _textBgX = room_width / 2 + 40;
	var _textBgY = 50;
	
	//Sprite properties
	var _textBgW = sprite_get_width(sTextBG) / 2;
	var _textBgH = sprite_get_height(sTextBG) / 2;
	var _border = 4;
	
	//Text Coords
	var _textX = _textBgX + _border;
	var _textY = _textBgY - (_textBgH) + _border - 1;

	var _page = global.textList[turnNumber];
	
	draw_sprite(sTextBG, 0, _textBgX, _textBgY);
	draw_set_font(fFontino);
	draw_set_color(c_white);
	
	//IL TESTO VIENE MOSTRATO SUBITO E SI PUO' SKIPPARE SUBITO
	if keyboard_check_pressed(ord("X")) { charCount = string_length(_page[page]); }
	
	dialogueDelay = setTimer(dialogueDelay);
	if (dialogueDelay == 0) && (charCount < string_length(_page[page])) 
	{
		charCount += speechSpeed; 
		playVoice(sndSteamPunkTalk, 2, _page);
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
	var _textPart = string_copy(_page[page], 1, charCount);
	var _col = make_color_rgb(0, 42, 127);
	draw_set_color(_col);
	draw_text_ext_transformed(_textX + 0.5 , _textY + 0.5, _textPart, _lSep, _textBgW * 4, 0.5, 0.5, 0);	
	draw_set_color(c_white);
	draw_text_ext_transformed(_textX, _textY, _textPart, _lSep, _textBgW * 4, 0.5, 0.5, 0);	

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