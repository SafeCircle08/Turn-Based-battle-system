event_inherited();

setBoxOrigin(room_width / 2, room_width / 2 - 50);
boxDimensions(250, 140);
genTimeVars(0, false, 99999, 0);
playerChangeState(oSoul.stateJumpUp);
oSoul.image_alpha = 1;
oSoul.canMove = true;
oSoul.hbX = 0;
oSoul.hbY = -10;
oBattleBox.draw = true;

instance_create_layer(global.boxOriginX, global.boxOriginY - 40, "ExtrasObjects", oPlatform);

//instance_create_layer(x, y, "Bullets", oBallBullet);