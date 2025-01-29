//feather disable all
if (oBattleBox.visible == false)// && (global.canDrawGui == true)
{
	//TEXT BOX VARIABLES SETUP
	guiX = surface_get_width(application_surface) / 2;
	guiY = surface_get_height(application_surface);
	draw_sprite(sTextBox, 0, guiX, guiY)
	var BUFFER = 4;
	
	//DRAWS THE TEXTBOX
	if (showBattleText)
	{
		var _textX = guiX - ((sprite_get_width(sTextBox) / 2) - BUFFER);
		var _textY = guiY - (sprite_get_height(sTextBox) + BUFFER);
		for (var a = 0; a <= messageCounter; a++)
		{
			draw_text_ext(_textX + BUFFER * 3 + shakeX, _textY + BUFFER * 4 + fontSize * a * 2 + shakeY, ds_messages[| a], (fontSize + BUFFER), sprite_get_width(sTextBox) - BUFFER * 3);
		}
	}
	
	//DRAWS ALL THE PLAYER VARIABLES
	var BUFFER = 4;
	var _hpX = surface_get_width(application_surface) / 2 - sprite_get_width(sTextBox) / 2; 
	var _hpY = surface_get_height(application_surface) - sprite_get_height(sTextBox) - BUFFER * 5;
	draw_text(_hpX + 110 + shakeX, _hpY - 17 + shakeY, "HP: " + string(global.playerHP) + " / " + string(global.playerMAX_HP) + ";"); //PLAYER
	draw_text(_hpX + shakeX + 10, _hpY + shakeY - 20, string(global.playerName) + ";");	//PLAYER NAME
	
	draw_text(_hpX + 10, _hpY, "CS: ");
	draw_sprite(sCSBarBG, 0, _hpX + shakeX + 50, _hpY + shakeY + 4);
	draw_sprite_stretched(sCSBar, 0, _hpX + shakeX + 50, _hpY + shakeY + 4, (global.CSvalue/global.CSvalueMax) * csbar_width, csbar_height);
	
	//DRAWS ALL THE MONSTER VARIABLES
	var _monsterHpX = surface_get_width(application_surface) / 2; 
	var _monsterHpY = surface_get_height(application_surface) - sprite_get_height(sTextBox) - BUFFER * 5;
	draw_set_color(c_red);
	draw_text(_monsterHpX + shakeX + 40, _monsterHpY + shakeY, "(" + string(global.monsterHP) + " / " + string(global.maxMonsterHp) + ")");
	draw_set_color(c_white);

	//DRAW THE BUTTONS
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
	
	//PLAYER OPTIONS SETUP VARIABLES
	optionXL = (guiX - sprite_get_width(sTextBox) / 2) + BUFFER * 10;
	optionXR = optionXL + 100;
	optionYL = guiY - BUFFER * 20;
	optionYR = guiY - BUFFER * 20;
	fontSize = font_get_size(fText);
	draw_set_font(fText);
	draw_set_color(c_white);
	
	//DRAWS THE OPTION THE PLAYER CAN TAKE AND THE ARROW
	if(!showBattleText)
	{
		for (var i = 0; i < array_length(a_text); i++)
		{	
			var optionX = guiX - ((sprite_get_width(sTextBox) / 2) - BUFFER + 12) + sprite_get_width(sLittleRectangle) / 2;
			var optionY = guiY - (((sprite_get_height(sTextBox)/2)) + sprite_get_height(sLittleRectangle) / 2) - 13;
			if selected_option == i 
			{
				if (i < 2) {draw_sprite(sArrow, 0, optionX - sprite_get_width(sArrow) + i * 160 - 5 + shakeX, optionY + shakeY)};
				if (i >= 2) {draw_sprite(sArrow, 0, (optionX + (i - 2) * 160) - sprite_get_width(sArrow) - 5 + shakeX, optionY + 50 + shakeY)}
			}
			text = a_text[i];
			
			if (i < 2) {draw_text(optionX + i * 160 + shakeX, optionY + shakeY, text)	}
			if (i >= 2) {draw_text(optionX + (i - 2) * 160 + shakeX, optionY + 50 + shakeY, text)}
		}
	}	
	
	draw_sprite(sSelfBox, oSupportPlayerhitbox.image_index, guiX - (sprite_get_width(sBattleBox) / 2 ) * 6.3, guiY);

	//DRAWS THE STATE BARS
	draw_sprite(sHealthBarBG, 0, healthbarX - 285, healthbarY - 41);
	draw_sprite(sShieldBarBG, 0, shieldBarX - 285, shieldBarY - 22);

	draw_sprite_stretched(sHealthBar, 0, healthbarX - 285, healthbarY - 41, (global.playerHP/global.playerMAX_HP) * healthbar_width, healthbar_height);
	draw_sprite_stretched(sShieldBar, 0, shieldBarX - 285, shieldBarY - 22, (global.playerShield/global.playerMaxShield) * shieldbar_width, shieldbar_height);

	draw_sprite(sBarCorner, 0, healthbarX - 285, healthbarY - 41);
	draw_sprite(sBarCorner, 0, shieldBarX - 285, shieldBarY - 22);
}
else
{
	var _yy = surface_get_height(application_surface) - 25;
	var _width = 145;
	
	draw_sprite_stretched(sWhiteRectangle, 0, 12, _yy, 620, 25)
	
	//BARS
	draw_sprite_stretched(sHealthBar, 0, 22, _yy + 5, (global.playerHP/global.playerMAX_HP) * _width * 2, healthbar_height);
	draw_sprite_stretched(sShieldBar, 0, 330, _yy + 5, (global.playerShield/global.playerMaxShield) * _width * 2, shieldbar_height);
	
	draw_text(75, _yy - 20, "HP: " + string(global.playerHP) + " / " + string(global.playerMAX_HP) + ";")		
}






