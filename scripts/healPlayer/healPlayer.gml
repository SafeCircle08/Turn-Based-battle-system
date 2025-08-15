function healPlayer(_amount, _sound, _channel = SOUND_CHANNEL_1)
{
	global.playerHP += _amount;
	var soundGain = 2;
	playSound(_sound, _channel, false, soundGain);
}