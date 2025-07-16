//feather disable all

//feather disable all

if (oBattleBox.visible == false)
{
	//Creates inv text object
	if (frame == -1)
	{
		invGUI = instance_create_depth(0, 0, 0, oText);
		for (var i = 0; i < array_length(global.items); i++)
		{
			array_push(invGUI.drawText, global.items[i])	
		}
		invGUI.actualArray = global.items;
		invGUI.visible = false;
		
		frame++;
	}
}