function hitPlayer(_dmg)
{
	global.playerHP -= _dmg;
	audio_play_sound(sndHurt, 50, false, global.soundGain);
	dmg = instance_create_layer(oSoul.x, oSoul.y, LAYER_BULLETS, oFloatingText);
	dmg.textReference = _dmg;
	dmg.damageIndex = 0;
	return;
}