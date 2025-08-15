function drawFreeText(_textList, _refObj = noone, _font = fFontino, _inBox = true)
{
	var _textSounds = [
		sndBasicTxt1,
	];
	
	var _boxX = camera_get_view_x(view_camera[view_current]);
	var _boxY = camera_get_view_height(view_camera[view_current]) + 1;
	
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
	var _xPos = _boxX + _border;
	var _yPos = _boxY - _height + 13;
	
	if (_inBox == true)
	{
		var _tollerance = 20;
		var _cameraH = camera_get_view_height(view_camera[view_current]) / 2;		
		
		//The player is "on the textBox"
		if (oPlayerOW.y > _cameraH + _tollerance)
		{
			_boxY = camera_get_view_y(view_camera[view_current]) + _height - 2;
			_yPos = _boxY - _height + 13;
		}
		
		//Draws the text box
		draw_sprite(_sprTxtBox, 0, _boxX + sprite_get_width(_sprTxtBox) / 2, _boxY);	
		draw_set_halign(fa_left);
	}
	
	//IL TESTO VIENE MOSTRATO SUBITO E SI PUO' SKIPPARE SUBITO
	if keyboard_check_pressed(ord("X")) { charCount = string_length(_textList[page]); }
	
	//Adds delay if it finds commas or point etc...
	dialogueDelay = setTimer(dialogueDelay);
	if (dialogueDelay == 0) && (charCount < string_length(_textList[page])) 
	{
		charCount += speechSpeed;
		playVoice(sndBasicTxt1, 1, _textList);
		if (string_char_at(_textList[page], charCount) == "." || string_char_at(_textList[page], charCount) == "?" || string_char_at(_textList[page], charCount) == "!") 
		{
			dialogueDelay = 10;
		}
		if (string_char_at(_textList[page], charCount) == ",")
		{
			dialogueDelay = 5;
		}
	}
	
	if (instance_exists(_refObj))
	{
		if (charCount < string_length(_textList[page]))
		{
			_refObj.image_speed = 1; 
		}	
		else
		{
			_refObj.image_speed = 0; 
			_refObj.image_index	= 0;				
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
	if keyboard_check_pressed(vk_enter) && (charCount >= string_length(_textList[page]))
	{
		if (page + 1 < array_length(_textList))
		{
			page++;
			charCount = 0;			
		}
		else 
		{
			oPlayerOW.canMove = true;
			charCount = 0;
			page = 0;
			speechSpeed = 0.5;
			draw_set_halign(fa_left);
			instance_destroy();
		}  
	}	
}