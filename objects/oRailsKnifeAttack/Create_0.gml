event_inherited();
var _railBase = instance_create_layer(x, y, LAYER_BULLETS, oRailsAttack);
_railBase.rails_columns = 11;
_railBase.rails_lines = 9;
_railBase.actualPlayerPos = round(_railBase.rails_lines / 2);

boxDimensions(_railBase.rails_columns * _railBase.width, _railBase.rails_lines * _railBase.height)
genTimeVars(0, false, 9999, 0);
playerChangeState(oSoul.stateSliding);