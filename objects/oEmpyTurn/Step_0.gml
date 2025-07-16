event_inherited();

if keyboard_check(ord("X")) oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityBasic;
if keyboard_check(ord("Z")) oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityLeft;
if keyboard_check(ord("C")) oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityRight;
if keyboard_check(ord("V")) oSoul.inUseGravity = global.playerJumpStateMoveInfo.gravityUp;