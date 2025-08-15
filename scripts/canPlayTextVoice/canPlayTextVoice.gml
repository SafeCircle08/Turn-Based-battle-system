function canPlayTextVoice(_textList)
{
	return (charCount mod 1 == 0) && (string_char_at(_textList[page], charCount) != " ")
}

function playVoice(_voiceIndex, _voiceSoundGain, _textList)
{
	if (canPlayTextVoice(_textList)) {
		playSound(_voiceIndex, SOUND_CHANNEL_2, false, _voiceSoundGain);	
	}
}