//feather disable all
if (oBattleBox.visible == false)
{
	#region BOX VARIABLES SETUP
	guiX = surface_get_width(application_surface) / 2;
	guiY = surface_get_height(application_surface);
	draw_sprite(sTextBox, 0, guiX, guiY);
	fontSize = font_get_size(fGenericText);
	var _textBoxW = sprite_get_width(sTextBox);
	var _textBoxH = sprite_get_height(sTextBox);
	var BUFFER = 4;
	
	//DRAWS THE TEXTBOX
	if (showBattleText)
	{
		var _textX = guiX - (_textBoxW / 2) + BUFFER;
		var _textY = guiY - (_textBoxH + BUFFER);
		for (var a = 0; a <= messageCounter; a++)
		{
			draw_text_ext(_textX + BUFFER * 3 + shakeX, _textY + BUFFER * 4 + fontSize * a * 2 + shakeY, ds_messages[| a], (fontSize + BUFFER), _textBoxW - BUFFER * 3);
		}
	}
	#endregion
	#region DRAWS ALL THE PLAYER VARIABLES
	var _hpX = guiX - _textBoxW / 2; 
	var _hpY = guiY - _textBoxH - (BUFFER * 5) - 4;
	
	//PLAYER HEALTH POINT--------------------------
	draw_text(_hpX + 90 + shakeX, _hpY + shakeY - (5 * BUFFER) + 2, "HP: " + string(global.playerHP) + " / " + string(global.playerMAX_HP) + ";");
	
	//PLAYER NAME--------------------------
	draw_text(_hpX + shakeX + (2 * BUFFER), _hpY + shakeY - (5 * BUFFER), string(global.playerName) + ";");
	
	//PLAYER CAGE STATE BAR--------------------------
	var _barCsW = 121;
	var _barCsH = 10;
	draw_text(_hpX + shakeX + (2 * BUFFER), _hpY + shakeY, "CS: ");
	draw_sprite(sCSBarBG, 0, _hpX + shakeX + (BUFFER * 10), _hpY + shakeY + (BUFFER * 2));
	draw_sprite_stretched(sCSBar, 0, _hpX + shakeX + (BUFFER * 10), _hpY + shakeY + (BUFFER * 2), (global.CSvalue/global.CSvalueMax) * _barCsW, _barCsH);
	#endregion
	#region DRAWS ALL THE MONSTER VARIABLES
	var _monsterHpX = guiX; 
	var _monsterHpY = guiY - _textBoxH - (BUFFER * 5) - 4;
	draw_set_color(c_red);
	draw_text(_monsterHpX + shakeX + 40, _monsterHpY + shakeY, "(" + string(global.monsterHP) + " / " + string(global.maxMonsterHp) + ")");
	draw_set_color(c_white);
	#endregion
	#region DRAW THE BUTTONS
	if (!showBattleText)
	{
		for (var i = 0; i < array_length(a_text); i++)
		{
			var _buttonX = guiX - ((sprite_get_width(sTextBox) / 2) - BUFFER) + 12;
			var _buttonY = guiY - (sprite_get_height(sTextBox) + BUFFER) + 25;
			var _index = 0;
			var _xBufferFirst = 160;
			
			if (selected_option == i) { _index = 1};
			
			if (i < 2) {draw_sprite(sLittleRectangle, _index, _buttonX + i * _xBufferFirst, _buttonY)}
			if (i >= 2) {draw_sprite(sLittleRectangle, _index, _buttonX + (i - 2) * _xBufferFirst, _buttonY + 50)}
		}
	}
	#endregion
	#region PLAYER OPTIONS SETUP VARIABLES
	optionXL = (guiX - _textBoxW / 2) + BUFFER * 10;
	optionXR = optionXL + 100;
	optionYL = guiY - BUFFER * 20;
	optionYR = guiY - BUFFER * 20;
	draw_set_font(fGenericText);
	draw_set_color(c_white);
	#endregion
	#region DRAWS THE OPTION THE PLAYER CAN TAKE AND THE ARROW
	if(!showBattleText)
	{
		for (var i = 0; i < array_length(a_text); i++)
		{	
			var optionX = guiX - ((_textBoxW / 2) - BUFFER + 12) + sprite_get_width(sLittleRectangle) / 2 + 4;
			var optionY = guiY - (_textBoxH - sprite_get_height(sLittleRectangle) / 2) + 10;
			if (selected_option == i) && (acting = false)
			{
				if (i < 2) { draw_sprite(sArrow, 0, optionX - sprite_get_width(sArrow) + i * 160 - 10 + shakeX, optionY + 2 + shakeY)};
				if (i >= 2) { draw_sprite(sArrow, 0, (optionX + (i - 2) * 160) - sprite_get_width(sArrow) - 10 + shakeX, optionY + 52 + shakeY)}
			}
			
			text = a_text[i];
			
			if (i < 2) { draw_text(optionX + i * 160 + shakeX, optionY + shakeY, text); }
			if (i >= 2) { draw_text(optionX + (i - 2) * 160 + shakeX, optionY + 50 + shakeY, text); }
		}
	}
	
	var _barX = guiX;
	var _barY = guiY;
	var _hpBarW = 121;
	var _hpBarH = 16;
	var _shieldBarW  = 121;
	var _shieldBarH = 16;
	var _selfBoxHeight = sprite_get_height(sSelfBox);
	
	draw_sprite(sSelfBox, oSupportPlayerhitbox.image_index, guiX - (_textBoxW), guiY);
	#endregion
	#region CREATES THE OBJECTS THAT HOLD TEXT INFO
	if (frame == -1)
	{
		invGUI = instance_create_depth(guiX, guiY, 0, oText);
		for (var i = 0; i < array_length(global.items); i++)
		{
			array_push(invGUI.drawText, global.items[i])	
		}
		invGUI.actualArray = global.items;
		invGUI.visible = false;
		
		frame++;
	}
	#endregion
	#region PLAYER USING THE INVENTORY
	//Taken the Item options-------------------------
	if (acting == true)
	{
		if (itemOption == true) { openingInv(); }	
	}
	
	#endregion
	#region DRAWS THE BARS
	//DRAWS THE STATE BARS BACKGROUNDS
	draw_sprite(sHealthBarBG, 0, _barX - (_textBoxW) + BUFFER * 7 + 2, _barY - BUFFER * 10 - 1);
	draw_sprite(sShieldBarBG, 0, _barX - (_textBoxW) + BUFFER * 7 + 2, _barY - BUFFER * 5 - 3);

	//DRAWS THE ACTUAL BARS
	draw_sprite_stretched(sHealthBar, 0, _barX - (_textBoxW) + BUFFER * 7 + 2, _barY - BUFFER * 10 - 1, (global.playerHP/global.playerMAX_HP) * _hpBarW, _hpBarH);
	draw_sprite_stretched(sShieldBar, 0, _barX - (_textBoxW) + BUFFER * 7 + 2, _barY - BUFFER * 5 - 3, (global.playerShield/global.playerMaxShield) * _shieldBarW, _shieldBarH);
	
	//STATE CAGE BAR
	//Si trova in playerVariables/stateCageBar
	
	//BAR DECORATION
	draw_sprite(sBarCorner, 0, _barX - (_textBoxW) + BUFFER * 7 + 2, _barY - BUFFER * 10 - 1);
	draw_sprite(sBarCorner, 0, _barX - (_textBoxW) + BUFFER * 7 + 2, _barY - BUFFER * 5 - 3);
	#endregion
}
else
{
	#region DRAWS THE BARS WHILE ENEMY IS ATTACKING
	var _yy = surface_get_height(application_surface) - 25;
	var _width = 145;
	var _hpBarW = 121;
	var _hpBarH = 16;
	var _shieldBarW  = 121;
	var _shieldBarH = 16;
	
	draw_sprite_stretched(sWhiteRectangle, 0, 12, _yy, 620, 25)
	
	//BARS
	draw_sprite_stretched(sHealthBar, 0, 22, _yy + 5, (global.playerHP/global.playerMAX_HP) * _width * 2, _hpBarH);
	draw_sprite_stretched(sShieldBar, 0, 330, _yy + 5, (global.playerShield/global.playerMaxShield) * _width * 2, _shieldBarH);
	
	draw_text(75, _yy - 20, "HP: " + string(global.playerHP) + " / " + string(global.playerMAX_HP) + ";")	
	#endregion
}