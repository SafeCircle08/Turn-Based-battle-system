event_inherited();

genTimeVars(120, false, 1500, 0);
numberOfMagnets = 7;
boxDimensions(240, sprite_get_height(sMagnet)*numberOfMagnets);
oSoul.umbrelling = false; //Per far si che non si bugghi
playerChangeState(oSoul.stateGravity, sEffectGravity, "Front");
setBoxOrigin(room_width / 2, 100);
global.yOffset = -30;
chemistryBulletsYs = [];
chemistryBulletsYindex = 0;
magnetsX = 0;
bossIndex = 0;
magnetsCreated = false;

instance_create_layer(global.boxOriginX - (global.borderWidth) / 4, global.boxOriginY + (global.borderHeight) / 4, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX + (global.borderWidth) / 4, global.boxOriginY + (global.borderHeight) / 4, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX, global.boxOriginY, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX - (global.borderWidth) / 4, global.boxOriginY - (global.borderHeight) / 4, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX + (global.borderWidth) / 4, global.boxOriginY - (global.borderHeight) / 4, "ExtrasObjects", oPlatform)