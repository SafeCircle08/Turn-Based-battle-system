hsp = 0;
vsp = 0;
canMove = true;
owSpd = 1.5;
shading = false;
triggeredChangeRoomTrigger = false;

function startChangeRoom(_dest, _newX, _newY)
{
	var _myTrans = instance_create_depth(oCamera.finalCamX, oCamera.finalCamY, -9999, oTransitionRoom);
	_myTrans.destination = _dest;
	_myTrans.playerX = _newX;
	_myTrans.playerY = _newY;
}

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