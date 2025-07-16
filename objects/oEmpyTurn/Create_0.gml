event_inherited();

oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityBasic;

setBoxOrigin(room_width / 2, room_width / 2 - 50);
boxDimensions(250, 200);
genTimeVars(0, false, 99999, 0);
playerChangeState(oSoul.stateGravity, sSpiderEffect, "Up");

oSoul.image_alpha = 1;
oSoul.canMove = true;
oBattleBox.draw = true;


var _x = global.boxOriginX - 60;
var _y = global.boxOriginY + 30;

for (var i = 0; i < 4; i++)
{
	instance_create_layer(_x + (40 * i), _y, layer, oPlatform);	
}