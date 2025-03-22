global.items[0] = "Pizza"
global.items[1] = "Candy"
global.items[2] = "Spd. Pot."
global.items[3] = "Kfc" 

/*
//GLI STRUCS SI POSSONO ANCHE ANNIDARE (FICO)
global.ITEMS =
{
	pizza:
	{
		sprite: sPizza,
		hp: 100,
	},
	kfc:
	{
		sprite: sKfc,
		hp: 300
	}
}
*/

#region Da fare testing con questi dizionari

global.pizza =
{
	sprite: sPizza,
	hp: 200, 
	info: "A slice of pizza... You have bad feelings about it...",
	outPutMessage: "You ate a slice of pizza! It wasn't good tho..."
}

global.kfc =
{
	sprite: sKfc,
	hp: 200,
	info: "you have seen too many memes to take that seriusly...",
	outPutMessage: "You became a black ninja! How awesome isnt it?"
}

global.candy =
{
	sprite: sCandy,
	hp: 200,
	info: "Candy candy candy! Just take ONLY one candy!",
	outPutMessage: "You took one candy... You would like to take more, but you can't..."
}
#endregion


global.itemsSprites =
{
	pizza: sPizza,
	spdPot: sSpdPotion,
	candy: sCandy,
	kfc: sKfc,
}

global.itemSpriteDraw = global.itemsSprites.pizza;

function usingItem(_index)
{
	if (global.items[_index]) == "Pizza"
	{
		global.playerHP += global.pizza.hp;
		_message = [">You ate a slice of pizza... It wasn't even good... \n>You gained " + string(global.pizza.hp) + " HP!"];
		if (global.playerHP + 200) >= global.playerMAX_HP
		{
			_message = [">You ate a slice of pizza... It wasn't even good... \n>You gained " + string(global.pizza.hp) + " HP!\nHP maxed out!"];
		}
		instance_create_depth(290, 90, -9999, oHealingEffect);
	}
	if (global.items[_index]) == "Candy"
	{
		global.playerHP += global.candy.hp;
		_message = [">You ate one candy... It was too sweat... \n>You gained " + string(global.candy.hp) + " HP!"];
		if (global.playerHP + 200) >= global.playerMAX_HP
		{
			_message = [">You ate a slice of pizza... It wasn't even good... \n>You gained " + string(global.pizza.hp) + " HP!\nHP maxed out!"];
		}
		instance_create_depth(290, 90, -9999, oHealingEffect);
	}
	if (global.items[_index]) == "Spd. Pot."
	{		
		global.playerHP += 200;
		_message = [">You drunk the potion.\n>You feel like you got super powers!\n >Speed increased!"];
		if (global.playerHP + 200) >= global.playerMAX_HP
		{
			_message = [">You ate a slice of pizza... It wasn't even good... \n>You gained " + string(global.pizza.hp) + " HP!\nHP maxed out!"];
		}
		instance_create_depth(290, 90, -9999, oHealingEffect);
	}
	if (global.items[_index]) == "Kfc"
	{
		global.playerHP += global.kfc.hp;
		_message = [">You've seen too many reels... You know you became one of them... \n>You gained " + string(global.kfc.hp) + " HP!"];
		if (global.playerHP + 200) >= global.playerMAX_HP
		{
			_message = [">You ate a slice of pizza... It wasn't even good... \n>You gained " + string(global.pizza.hp) + " HP!\nHP maxed out!"];
		}
		instance_create_depth(290, 90, -9999, oHealingEffect);
	}
	return _message;
}

function itemInfo(_index)
{
	if (global.items[_index]) == "Pizza"
	{
		_itemInfo = ">Great food!\n>Heals you 5 HP!\n>You think it smells bad tho...";
		global.itemSpriteDraw = global.itemsSprites.pizza;
	}
	if (global.items[_index]) == "Candy"
	{
		_itemInfo = ">The candy looks so good. \n>It has magic colors."
		global.itemSpriteDraw = global.itemsSprites.candy;
	}
	if (global.items[_index]) == "Spd. Pot."
	{
		_itemInfo = ">That potion keep emitting weird sounds from your pocket... Should you actually drink it?"
		global.itemSpriteDraw = global.itemsSprites.spdPot;
	}
	if (global.items[_index]) == "Kfc"
	{
		_itemInfo = ">You know pretty well what all of this is about..."
		global.itemSpriteDraw = global.itemsSprites.kfc;
	}
	return _itemInfo		
}