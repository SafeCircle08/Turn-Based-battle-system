event_inherited();

oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityLeft;
initializeNewTurn(0, false, 99999, 0, 220, 100, room_width / 2, room_height / 2, oSoul.stateGravity);
oSoul.image_alpha = 1;
oSoul.canMove = true;
oBattleBox.draw = true;


var _x = global.boxOriginX - 60;
var _y = global.boxOriginY + 30;

for (var i = 0; i < 4; i++)
{
	instance_create_layer(_x + (40 * i), _y, layer, oPlatform);	
}

function jumpDebugKeys()
{
	var state = global.playerStateGravity;
	if (keyboard_check_pressed(ord("Z"))) {
		oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityBasic;
		playerChangeState(state, method(self, function() { additionalGravityStateMethod(0); }))
	}
	if (keyboard_check_pressed(ord("X"))) {
		oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityUp;
		playerChangeState(state, method(self, function() { additionalGravityStateMethod(0); }))
	}
	if (keyboard_check_pressed(ord("C"))) {
		oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityLeft;
		playerChangeState(state, method(self, function() { additionalGravityStateMethod(0); }))
	}
	if (keyboard_check_pressed(ord("V"))) {
		oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityRight;
		playerChangeState(state, method(self, function() { additionalGravityStateMethod(0); }))
	}
}