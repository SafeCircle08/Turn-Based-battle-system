event_inherited();

numberOfMagnets = 7;

initializeNewTurn(120, false, 800, 0, 240, sprite_get_height(sMagnet)*numberOfMagnets, room_width / 2, 100, oSoul.stateGravity);

global.yOffset = -30;
chemistryBulletsYs = [];
chemistryBulletsYindex = 0;
magnetsX = 0;
bossIndex = 0;
magnetsCreated = false;

instance_create_layer(global.boxOriginX - (global.borderWidth) / 4, global.boxOriginY + (global.borderHeight) / 4, LAYER_EXTRAS_OBJECTS, oPlatform)
instance_create_layer(global.boxOriginX + (global.borderWidth) / 4, global.boxOriginY + (global.borderHeight) / 4, LAYER_EXTRAS_OBJECTS, oPlatform)
instance_create_layer(global.boxOriginX, global.boxOriginY, LAYER_EXTRAS_OBJECTS, oPlatform)
instance_create_layer(global.boxOriginX - (global.borderWidth) / 4, global.boxOriginY - (global.borderHeight) / 4, LAYER_EXTRAS_OBJECTS, oPlatform)
instance_create_layer(global.boxOriginX + (global.borderWidth) / 4, global.boxOriginY - (global.borderHeight) / 4, LAYER_EXTRAS_OBJECTS, oPlatform)