event_inherited();

genTimeVars(120, false, 11900, 0)

global.pov = "Front"; //il player può saltare

global.yOffset = -30;
numberOfMagnets = 7;
chemistryBulletsYs = []
chemistryBulletsYindex = 0;
magnetsX = 0;
bossIndex = 0;
magnetsCreated = false;
//DIMENSIONI DEL BOX
global.borderWidth = 200;
global.borderHeight = (sprite_get_height(sMagnet)*numberOfMagnets);

playerChangeState(oSoul.stateGravity, 3)

instance_create_layer(global.boxOriginX - (global.borderWidth) / 4, global.boxOriginY + (global.borderHeight) / 4, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX + (global.borderWidth) / 4, global.boxOriginY + (global.borderHeight) / 4, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX, global.boxOriginY, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX - (global.borderWidth) / 4, global.boxOriginY - (global.borderHeight) / 4, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX + (global.borderWidth) / 4, global.boxOriginY - (global.borderHeight) / 4, "ExtrasObjects", oPlatform)