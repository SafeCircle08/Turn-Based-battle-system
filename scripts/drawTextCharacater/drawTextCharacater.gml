//Punteggiatura:
/*
	
	* -> Usato per i discorsi a voce alta (parlati);
	<> -> usato per i pensieri;
	[..] -> Usato per i discorsi a bassa voce;

*/

function drawFreeCharacter(_textList,_charObj, _font = fFontino)
{
	//Basic properties
	var _sprTxtBox = sNewBox;
	var _lSep = 15;
	var _border = 27;
	draw_set_font(_font);
	draw_set_halign(fa_center);
	
	//Where the box is draw
	var _boxX = camera_get_view_x(view_camera[view_current]) + 160;
	var _boxY = camera_get_view_height(view_camera[view_current]);

	var _cameraH = camera_get_view_height(view_camera[view_current]) / 2;		
	var _maxW = sprite_get_width(_sprTxtBox) - (_border * 2);
	
	var _tollerance = 20;
	var _sprH = sprite_get_height(_sprTxtBox);
	
	//Where the text and the sprites are being draw
	var _xPos = camera_get_view_x(view_camera[view_current]) + _border;
	var _yPos = _boxY - _sprH + _border;
	
	//The player is "on the textBox"
	if (oPlayerOW.y > _cameraH + _tollerance)
	{
		_boxY = camera_get_view_y(view_camera[view_current]) + _sprH - 5;
		_yPos = _boxY - _border;
	}
	
	//Draws the box at the right coordinates
	draw_sprite(_sprTxtBox, 0, _boxX, _boxY);	
	draw_set_halign(fa_left);
	
	//Check what face should be drawn
	if (charCount == 0)
	{	
		//Check if there is the '=' at the start of the text string
		if (string_char_at(_textList[page], 1) == "=")
		{
			//'=H': HAPPY FACE
			if (string_char_at(_textList[page], 2) == "H")
			{
				spriteFace = _charObj.spriteHappy;
				charCountBuffer = 2;
			}
			//'=S': SAD FACE
			if (string_char_at(_textList[page], 2) == "S")
			{
				spriteFace = _charObj.spriteSad;
				charCountBuffer = 2;
			}
			//'=O': OTHER (will be followed by another letter to say the right other sprites)
			//for this, you should add a new if, and check the next index of the string (after the letter O)
			if (string_char_at(_textList[page], 2) == "O")
			{
				spriteFace = _charObj.spriteOther;
				charCountBuffer = 2;
			}
			//If there is not any '=...':draws the base face
		} else { spriteFace = _charObj.spriteBase; }
	}
	
	//Draws the face
	draw_sprite(spriteFace, 0, _xPos - 10, _yPos - 5);
	
	//If you click X, the text gets drawn all at once
	if keyboard_check_pressed(ord("X")) { charCount = string_length(_textList[page]); }
	
	//Adds delay if there are commas or points (gives funky feeling)
	dialogueDelay = setTimer(dialogueDelay);
	if (dialogueDelay == 0) && (charCount < string_length(_textList[page])) 
	{
		charCount += speechSpeed; 
		//Used to remove the '=S' things (used to draw the right face)
		var strIndex = charCount + charCountBuffer;
		if (string_char_at(_textList[page], strIndex) == "." || string_char_at(_textList[page], strIndex) == "?" || string_char_at(_textList[page], strIndex) == "!") 
		{
			dialogueDelay = 15;
		}
		if (string_char_at(_textList[page], strIndex) == ",")
		{
			dialogueDelay = 7;
		}
	}
	
	//Actually draws the text	
	draw_set_color(c_gray);
	var _xOffset = 45; //Based on the width of the face
	var _textPart = string_copy(_textList[page], 1 + charCountBuffer, charCount);
	draw_text_ext(_xPos + 0.5 + _xOffset, _yPos + 0.5, _textPart, _lSep, _maxW - _xOffset);
	draw_set_color(c_white);
	draw_text_ext(_xPos + _xOffset, _yPos, _textPart, _lSep, _maxW - _xOffset);

	//If you press enter and there are still new pages
	if keyboard_check_pressed(vk_enter) && (charCount >= string_length(_textList[page]))
	{
		if (page + 1 < array_length(_textList))
		{
			page++;
			charCount = 0;
			charCountBuffer = 0;
		}
		else 
		{
			//If there are no pages
			//Everything gets reset and the textInstance
			//Gets destroyed
			oPlayerOW.canMove = true;
			charCountBuffer = 0;
			charCount = 0;
			page = 0;
			speechSpeed = 0.5;
			draw_set_halign(fa_left);
			instance_destroy();
		}  
	}	
}