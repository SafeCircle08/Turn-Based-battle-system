function drawFreeText_battle(_textList, _font = fFontino, _inBox = true)
{
	var _boxX = camera_get_view_x(view_camera[view_current]) + sprite_get_width(sNewBox) / 2;
	var _boxY = camera_get_view_height(view_camera[view_current]);
	
	//Basic properties
	var _lSep = 15;
	var _border = 10;
	draw_set_font(fFontino);
	draw_set_halign(fa_center);
	
	//Box properties
	var _sprTxtBox = sNewBox;
	var _height = sprite_get_height(_sprTxtBox);
	var _maxW = sprite_get_width(_sprTxtBox) - (_border * 2);
	
	//Where the text is being drawn
	var _xPos = _boxX + _border - sprite_get_width(sNewBox) / 2;
	var _yPos = _boxY - _height + 15;
	
	if (_inBox == true)
	{
		var _tollerance = 20;
		var _cameraH = camera_get_view_height(view_camera[view_current]) / 2;		
		
		//Draws the text box
		draw_sprite(_sprTxtBox, 0, _boxX, _boxY);	
		draw_set_halign(fa_left);
	}
	
	//Adds delay if it finds commas or point etc...
	dialogueDelay = setTimer(dialogueDelay);
	if (dialogueDelay == 0) && (charCount < string_length(_textList[page])) 
	{
		charCount += speechSpeed; 
		
		playVoice(sndBasicTxt4, 0.7, _textList);
		
		if (string_char_at(_textList[page], charCount) == "." || string_char_at(_textList[page], charCount) == "?" || string_char_at(_textList[page], charCount) == "!") 
		{
			dialogueDelay = 10;
		}
		if (string_char_at(_textList[page], charCount) == ",")
		{
			dialogueDelay = 5;
		}
	}

	//Actually draws the text letter by letter...
	draw_set_color(c_gray);
	var _textPart = string_copy(_textList[page], 1, charCount);
	draw_text_ext(_xPos + 0.5, _yPos + 0.5, _textPart, _lSep, _maxW);
	draw_set_color(c_white);
	draw_text_ext(_xPos, _yPos, _textPart, _lSep, _maxW);

	//Check if there are new pages to be shown when you press enter
	//Of if you can actually 'destroy' the text instance

	if keyboard_check_pressed(ord("Z")) && (charCount >= string_length(_textList[page]))
	{
		if (page + 1 < array_length(_textList))
		{
			page++;
			charCount = 0;			
		}
	}	
}