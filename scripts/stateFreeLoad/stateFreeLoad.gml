function stateFreeLoad(){
	stateFree = function()
	{
		stateInit(sPlayerFront, sNoEffects, "Up");
		hbX = 0;
		hbY = 2.5;
		if (canMove)
		{
			hsp = (key_right - key_left) * global.SoulSpeed;
			vsp = (key_down - key_up) * global.SoulSpeed;
	
			if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
			if (key_down) { sprite_index = sPlayerFront; image_speed = 1; }
			if (key_left) { sprite_index = sPlayerLeft; image_speed = 1; }
			if (key_up) { sprite_index = sPlayerBehind; image_speed = 1; }
			if (key_right) { sprite_index = sPlayerRight; image_speed = 1; }
			x += hsp;
			y += vsp;
		}
		var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
		var _possY = clamp(oSoul.y, global.border_u + 8, global.border_d - 11.5);
		oSoul.x = _possX;
		oSoul.y = _possY;
	}
}