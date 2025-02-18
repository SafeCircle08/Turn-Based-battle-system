global.items[0] = "Pizza"
global.items[1] = "Burgir"
global.items[2] = "Slime"
global.items[3] = "Kfc" 

function usingItem(_index)
{
	if (global.items[_index]) == "Pizza"
	{
		show_debug_message("usato: item 1");
		_message = ["You used item 1... it is useful!"]
		global.playerHP += 10;
		instance_create_depth(290, 90, -9999, oHealingEffect);
	}
	
	if (global.items[_index]) == "Burgir"
	{
		show_debug_message("usato: item 2")	
		_message = ["Using item 2 wasn't a good choice..."]
		global.playerHP += 50;
		instance_create_depth(290, 90, -9999, oHealingEffect);
	}
	
	if (global.items[_index]) == "Slime"
	{
		show_debug_message("usato: item 3")				
		_message = ["3", "miggers", "moment"]
		global.playerHP += 100;
		instance_create_depth(290, 90, -9999, oHealingEffect);
	}
	
	if (global.items[_index]) == "Kfc"
	{
		show_debug_message("usato: item 4")	
		_message = ["Four its like 2 + 2 and 2 * 2"]
		global.playerHP += 200;
		instance_create_depth(290, 90, -9999, oHealingEffect);
	}
	return _message;
}

function itemInfo(_index)
{
	if (global.items[_index]) == "Pizza"
	{
		_itemInfo = "Great food! \n Heals you 5 HP!"
	}
	
	if (global.items[_index]) == "Burgir"
	{
		_itemInfo = "Grea! \n Heals you 69 HP!"
	}
	
	if (global.items[_index]) == "Slime"
	{
		_itemInfo = "Great food! \n Heals you 420 HP!"
	}
	
	if (global.items[_index]) == "Kfc"
	{
		_itemInfo = "Great food! \n Heals you nega HP!"
	}
	return _itemInfo		
}