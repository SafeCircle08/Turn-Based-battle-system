if (enemyCanShowText) && (enemyTextShowed == false)
{
	show_debug_message(textSkipTimer)
	textSkipTimer = setTimer(textSkipTimer) - 1;
	var _xSep = 15;
	var _ySep = 5;	
	var _x = 200;
	var _y = 50;
	var _page = global.textList[turnNumber - 1];
	
	//Il "fumetto" per mostrare il Testo
	draw_sprite(sTextBG, 0, _x, _y);
	//Steam Punk Guy talking Font
	draw_set_font(fTalkFont_2);
	draw_set_color(c_white);
	
	//CONTROLLA SE LA PAGINA IN QUESTIONE E' UN ARRAY O MENO
	if !is_array(global.textList[turnNumber - 1])
	{	
		//IL TESTO VIENE MOSTRATO SUBITO E SI PUO' SKIPPARE SUBITO
		if keyboard_check_pressed(ord("X")) { charCount = string_length(_page); textSkipTimer = -1; }
		
		//FA PROGREDIRE IL TESTO LETTERA PER LETTERA
		if (charCount < string_length(_page)) { charCount += speechSpeed; }
		var _textPart = string_copy(_page, 1, charCount);
		draw_text_ext_transformed(_x + _xSep, _y - (sprite_get_height(sTextBG) / 2) + _ySep, _textPart, stringHeight, boxWidth + 50, 0.5, 0.5, 0);
		
		//SE PUOI EFFETTIVAMENTE SKIPPARE
		if (textSkipTimer < 0) && (charCount == string_length(_page))
		{
			if (keyboard_check_pressed(vk_enter)) { enemyTextShowed = true; textSkipTimer = 100; }
		}		
	}
	else
	{
		//IL TESTO VIENE MOSTRATO SUBITO E SI PUO' SKIPPARE SUBITO
		if keyboard_check_pressed(ord("X")) { charCount = string_length(_page[page]); textSkipTimer = 0; }
		
		//FA PROGREDIRE IL TESTO LETTERA PER LETTERA
		if (charCount < string_length(_page[page])) { charCount += speechSpeed; }
		var _textPart = string_copy(_page[page], 1, charCount);
		draw_text_ext_transformed(_x + _xSep, _y - (sprite_get_height(sTextBG) / 2) + _ySep, _textPart, stringHeight, boxWidth + 50, 0.5, 0.5, 0);
		
		//SE PUOI EFFETTIVAMENTE SKIPPARE
		if (textSkipTimer < 0)
		{
			if (keyboard_check_pressed(vk_enter))
			{ 
				//CONTROLLA SE SI E' NELL'ULTIMA PAGINA O MENO DEL TESTO ATTUALE
				if (page + 1 < array_length(_page))
				{
					page++;
					charCount = 0;
					textSkipTimer = 100;
				} else { enemyTextShowed = true; textSkipTimer = 100; }
			}
		}	
	}
}

draw_set_color(c_white);
draw_set_font(fGenericText);

if (enemyTextShowed == true) { draw_set_color(c_white); }