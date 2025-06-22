if (enemyCanShowText) && (enemyTextShowed == false)
{
	var _border = 7;
	var _xSep = 17;
	var _ySep = 5;	
	var _lSep = 20;
	var _x = 200;
	var _y = 50;
	var _page = global.textList[turnNumber - 1];
	
	draw_sprite(sTextBG, 0, _x, _y);
	draw_set_font(fTalkFont_2);
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