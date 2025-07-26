//Gloval values for the sounds and music
//In that way, we can change the 
//gain of each sound or music by will.
//Useful for menus. (volume setting)

//Sound channels based on priority
#macro SOUND_CHANNEL_1 10
#macro SOUND_CHANNEL_2 20
#macro SOUND_CHANNEL_3 30
#macro SOUND_CHANNEL_4 40
#macro SOUND_CHANNEL_5 50

//Music channels based on priority
#macro MUSIC_CHANNEL 80
#macro MUSIC_CHANNEL_2 90

global.soundGain = 0.2;
global.musicGain = 1;

function playSound(sndIndex, sndChannel, loop = false, gain = global.soundGain)
{
	audio_play_sound(sndIndex, sndChannel, loop, gain);
}

function playMusic(mscIndex, mscChannel, loop = true, gain = global.musicGain)
{
	audio_play_sound(mscIndex, mscChannel, loop, gain);
}