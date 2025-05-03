toDestroyTimer = setTimer(toDestroyTimer);

//Making the player slowly walking away
if (hits >= 2 && hits < 4)
{
	oSoul.y += 0.05;
	oSoul.image_speed = 0.5;
}

if (toDestroyTimer == 0)
{
	oSoul.sprite_index = sPlayerBehind;
	oBoxDestroying.image_index++;
	toDestroyTimer = 100;
	hits++;
	audio_play_sound(sndBallBounce, 50, false, global.soundGain);
	oShake.shake = true;
	
	//Quando lo distrugge
	if (hits == 4)
	{ 
		var _xx = oSoul.x; 
		var _yy = oSoul.y;
		var _hspd = [ -20, -5, 15, 5, -10 ];
		var _vspd = [ -15, -10, -5, +15, +10 ];
		var _pieces = [sBoxPiece1, sBoxPiece2, sBoxPiece3, sBoxPiece4, sBoxPiece5];
		for (var i = 0; i < 5; i++)
		{
			piece = instance_create_layer(_xx, _yy, "ExtrasObjects", oBoxPiece);
			piece.sprite_index = _pieces[i];
			piece.hspeed = _hspd[i];
			piece.vspeed = _vspd[i];
			piece.angleAdd = irandom_range(10, 25);
		}
		instance_destroy(oBoxDestroying);
		instance_create_layer(_xx, _yy, "ExtrasObjects", oAngryHand);
		oBattleBox.draw = 0;
		instance_destroy(self);
	}
}