frame = 270;
delayTimer = 30;
cosMultiplier = 1;
angleRef = 0;
var fx = instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oIncreaseAlphaDimFX);
fx.sprite_index = sElectronCircle;
fx.image_angle = oElectronCircle.electronN * 30;
playSound(sndAllert_1, SOUND_CHANNEL_1);