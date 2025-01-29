if (enemyCanShowText) && (enemyTextShowed == false)
{
	textSkipTimer--;
	var _xSep = 15;
	var _ySep = 5;	
	var _x = 200;
	var _y = 50;
	
	draw_sprite(sTextBG, 0, _x, _y);
	draw_set_font(fText);
	draw_set_color(c_white);
	
	//CONTROLLA SE LA PAGINA IN QUESTIONE E' UN ARRAY O MENO
	if !is_array(global.textList[turnNumber - 1])
	{
		//IL TESTO VIENE MOSTRATO SUBITO E SI PUO' SKIPPARE SUBITO
		if keyboard_check_pressed(ord("X")) { charCount = string_length(global.textList[turnNumber - 1]); textSkipTimer = 0;}
		
		//FA PROGREDIRE IL TESTO LETTERA PER LETTERA
		if (charCount < string_length(global.textList[turnNumber - 1])) { charCount += speechSpeed; }
		textPart = string_copy(global.textList[turnNumber - 1], 1, charCount);
		draw_text_ext_transformed(_x + _xSep, _y - (sprite_get_height(sTextBG) / 2) + _ySep, textPart, stringHeight, boxWidth + 50, 0.5, 0.5, 0);
		
		//SE PUOI EFFETTIVAMENTE SKIPPARE
		if (textSkipTimer < 0)
		{
			if (keyboard_check_pressed(vk_enter)) { enemyTextShowed = true; textSkipTimer = 50; }
		}		
	}
	else
	{
		//IL TESTO VIENE MOSTRATO SUBITO E SI PUO' SKIPPARE SUBITO
		if keyboard_check_pressed(ord("X")) { charCount = string_length(global.textList[turnNumber - 1][page]); textSkipTimer = 0; }
		
		//FA PROGREDIRE IL TESTO LETTERA PER LETTERA
		if (charCount < string_length(global.textList[turnNumber - 1][page])) { charCount += speechSpeed; }
		textPart = string_copy(global.textList[turnNumber - 1][page], 1, charCount);
		draw_text_ext_transformed(_x + _xSep, _y - (sprite_get_height(sTextBG) / 2) + _ySep, textPart, stringHeight, boxWidth + 50, 0.5, 0.5, 0);
		
		//SE PUOI EFFETTIVAMENTE SKIPPARE
		if (textSkipTimer < 0)
		{
			if (keyboard_check_pressed(vk_enter)) 
			{ 
				//CONTROLLA SE SI E' NELL'ULTIMA PAGINA O MENO DEL TESTO ATTUALE
				if (page + 1 < array_length(global.textList[turnNumber - 1]))
				{
					page++;
					charCount = 0;
					textSkipTimer = 50;
				} else { enemyTextShowed = true; textSkipTimer = 50 }
			}
		}	
	}
}

draw_set_color(c_white);
//draw_text_transformed(5, 30, "FPS REAL: " + string(fps_real), 0.5, 0.5, image_angle)
//draw_text_transformed(5, 60, "Current FPS " + string(fps), 0.5, 0.5, image_angle)


if (enemyTextShowed == true) { draw_set_color(c_white); }