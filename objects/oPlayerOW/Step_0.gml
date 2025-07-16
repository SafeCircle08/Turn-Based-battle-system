var key_right = keyboard_check(ord("D")); 
var key_left = keyboard_check(ord("A")); 
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

var key_rightPr = keyboard_check_pressed(ord("D")); 
var key_leftPr = keyboard_check_pressed(ord("A")); 
var key_upPr = keyboard_check_pressed(ord("W"));
var key_downPr = keyboard_check_pressed(ord("S"));

hsp = (key_right - key_left) * owSpd;
vsp = (key_down - key_up) * owSpd;

if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }

if (keyboard_check_pressed(vk_space)) { shading = true }

if (canMove == true)
{
	if (key_upPr) { sprite_index = sPlayerOwBehind; }
	if (key_downPr) { sprite_index = sPlayerOwFront; }
	if (key_rightPr) { sprite_index = sPlayerOwRight; }
	if (key_leftPr) { sprite_index = sPlayerOwLeft; }
	
	if (key_down) { sprite_index = sPlayerOwFront; image_speed = 1; }
	if (key_left) { sprite_index = sPlayerOwLeft; image_speed = 1; }
	if (key_up) { sprite_index = sPlayerOwBehind; image_speed = 1; }
	if (key_right) { sprite_index = sPlayerOwRight; image_speed = 1; }

	if (place_meeting(x + hsp, y, oWall)) { hsp = 0; image_speed = 0; image_index = 0; } 
	if (place_meeting(x, y + vsp, oWall)) { vsp = 0; image_speed = 0; image_index = 0; } 

	x += hsp;
	y += vsp;
}

if (instance_exists(oInstanceText) || instance_exists(oInstanceCharText))  
{ 
	image_speed = 0;
	canMove = false; 
	exit; 
} 

//---------- TEXT MENAGEMENT----------

var _actualTrigger = instance_place(x, y, oTextTrigger);
var _actualTxtCharTrigger = instance_place(x, y, oTextCharacterTrigger);

//If the player is colliding with the normal
//text trigger (no character face)
if (_actualTrigger) && (keyboard_check_pressed(vk_enter)) 
{
	//checkingText(_actualTrigger, oInstanceText);	
	if (_actualTrigger.playerShouldFace == "All")
	{
		var _myText = instance_create_layer(x, y, "Text", oInstanceText);
		_myText.text = _actualTrigger.textList;
	}
	else
	{
		if (sprite_index == _actualTrigger.playerShouldFace)
		{
			var _myText = instance_create_layer(x, y, "Text", oInstanceText);
			_myText.text = _actualTrigger.textList;	
			_myText.refObj = _actualTrigger.npcReference;
		}
	}
}

//If the player is collding with a character text box
//(adds all the different faces, sounds, etc...)
if (_actualTxtCharTrigger) && (keyboard_check_pressed(vk_enter))
{
	if (_actualTxtCharTrigger.playerShouldFace == "All")
	{
		var _myText = instance_create_layer(x, y, "Text", oInstanceCharText);
		_myText.character = _actualTxtCharTrigger.refChar;
		_myText.text = _actualTxtCharTrigger.textList;
	}
	else
	{
		if (sprite_index == _actualTxtCharTrigger.playerShouldFace)
		{
			var _myText = instance_create_layer(x, y, "Text", oInstanceCharText);
			_myText.character = _actualTxtCharTrigger.refChar;
			_myText.text = _actualTxtCharTrigger.textList;		
		}
	}				
}