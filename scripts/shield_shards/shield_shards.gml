function shield_shards()
{
	instance_create_layer(oSoul.x, oSoul.y, "ExtrasObjects", oShieldDebris);
	audio_play_sound(sndShieldBroke, 50, false, global.soundGain);
	for (var i = 0; i < 5; i++)
	{
		shard = instance_create_layer(oSoul.x, oSoul.y, "Bullets", oShieldShard);
		shard.hspeed = irandom_range(-3, 3);
		shard.vspeed = irandom_range(-1, -2);
		shard.gravity = 0.02;
	}
}