event_inherited();

setBoxOrigin(room_width / 2, room_width / 2 - 50);
boxDimensions(250, 200);
genTimeVars(0, false, 99999, 0);
playerChangeState(oSoul.stateSpider, sSpiderEffect, "SpiderPov");
oSoul.image_alpha = 1;
oSoul.canMove = true;
oBattleBox.draw = true;

instance_create_layer(global.boxOriginX, global.boxOriginY, layer, oPlatform);

//instance_create_layer(x, y, "Bullets", oBallBullet);