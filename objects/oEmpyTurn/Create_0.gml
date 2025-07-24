event_inherited();

oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityBasic;
initializeNewTurn(0, false, 99999, 0, 500, 100, room_width / 2, room_height / 2, oSoul.stateGravity);


oSoul.image_alpha = 1;
oSoul.canMove = true;
oBattleBox.draw = true;


var _x = global.boxOriginX - 60;
var _y = global.boxOriginY + 30;

for (var i = 0; i < 4; i++)
{
	instance_create_layer(_x + (40 * i), _y, layer, oPlatform);	
}