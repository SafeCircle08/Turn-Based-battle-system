hsp = 0;
vsp = 0;
canMove = true;
owSpd = 1.7;

checkingText = function(_trigger, _textInstance, _objRef = false)
{
	if (_trigger.playerShouldFace == "All")
	{
		var _myText = instance_create_layer(x, y, "Text", _textInstance);	
		_myText.text = _trigger.textList;
	}
	else
	{
		if (sprite_index == _trigger.playerShouldFace)
		{
			var _myText = instance_create_layer(x, y, "Text", _textInstance);
			_myText.text = _trigger.textList;		
		}
	}		
}