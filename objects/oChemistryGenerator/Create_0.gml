event_inherited();

global.bulletsCreated = 0;
global.created = false;
global.createTimer = 120;
global.enemyAttackTime = 800;

//ORIGINI DEL BOX
global.boxOriginX = 160;
global.boxOriginY = 80;
global.pov = "Front"; //il player può saltare

global.yOffset = -30;
numberOfMagnets = 7;
chemistryBulletsYs = []
chemistryBulletsYindex = 0;
magnetsX = 0;
bossIndex = 0;
//DIMENSIONI DEL BOX
global.borderWidth = 200;
global.borderHeight = (sprite_get_height(sMagnet)*numberOfMagnets);

oSoul.state = oSoul.stateGravity;

instance_create_layer(global.boxOriginX - (global.borderWidth) / 4, global.boxOriginY + (global.borderHeight) / 4, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX + (global.borderWidth) / 4, global.boxOriginY + (global.borderHeight) / 4, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX, global.boxOriginY, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX - (global.borderWidth) / 4, global.boxOriginY - (global.borderHeight) / 4, "ExtrasObjects", oPlatform)
instance_create_layer(global.boxOriginX + (global.borderWidth) / 4, global.boxOriginY - (global.borderHeight) / 4, "ExtrasObjects", oPlatform)