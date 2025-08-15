function stateMirroredLoad(){
	stateMirrored = function()
	{
		stateInit(sPlayerFrontMirrored, sInvertedEffect, "Up");
		hbX = 0;
		hbY = 2.5;
		hsp = (key_left - key_right) * global.SoulSpeed;
		vsp = (key_up - key_down) * global.SoulSpeed;
	
		if (hsp == 0) and (vsp == 0) { image_speed = 0; image_index = 0; }
	
		if (key_down) { sprite_index = sPlayerBehindMirrored; image_speed = 1; }
		if (key_left) { sprite_index = sPlayerRightMirrored; image_speed = 1; }
		if (key_up) { sprite_index = sPlayerFrontMirrored; image_speed = 1; }
		if (key_right) { sprite_index = sPlayerLeftMirrored; image_speed = 1; }
		x += hsp * (delta_time / 1_000_000) * WANTED_FPS;
		y += vsp * (delta_time / 1_000_000) * WANTED_FPS;
	
		var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
		var _possY = clamp(oSoul.y, global.border_u + 8, global.border_d - 11.5);
		oSoul.x = _possX;
		oSoul.y = _possY;
	}
}