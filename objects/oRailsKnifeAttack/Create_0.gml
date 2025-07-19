event_inherited();
var _railBase = instance_create_layer(x, y, LAYER_BULLETS, oRailsAttack);
_railBase.rails_columns = 11;
_railBase.rails_lines = 9;
_railBase.actualPlayerPos = round(_railBase.rails_lines / 2);

var _w = _railBase.rails_columns * _railBase.width;
var _h =  _railBase.rails_lines * _railBase.height;
var _x = room_width / 2; 
var _y = room_height / 2;

initializeNewTurn(0, false, 9999, 0, _w, _h, _x, _y, oSoul.stateSliding);