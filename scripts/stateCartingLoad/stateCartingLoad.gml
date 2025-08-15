function stateCartingLoad(){
	stateSliding = function()
	{
		var _createSparks = function() 
		{ 
			if (!instance_exists(oSlidingSparks))
			{
				instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oSlidingSparks);
			}
		}
		stateInit(sPlayerSliding, sPlayerPickaxe, "Front", _createSparks());
		sprite_index = oRailsAttack.spriteInput;
		if (instance_exists(oRailsAttack)) 
		{ 		
			var _maxX = oRailsAttack.maxPlayerX; 
			hsp = (key_right - key_left) * global.SoulSpeed;
			x = clamp(x, global.border_l + 12, _maxX - 10);
		}
	}
}