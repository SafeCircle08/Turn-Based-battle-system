// Inherit the parent event
event_inherited();

instance_destroy(oCannonLine);
toDestroyTimer = 100;
instance_create_layer(global.boxOriginX, global.boxOriginY, "ExtrasObjects", oBoxDestroying);
oSoul.sprite_index = sPlayerFront;
oSoul.image_speed = 0;
oSoul.image_index = 0;
hits = 0;
playerPos = 0;