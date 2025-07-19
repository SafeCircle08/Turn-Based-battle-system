event_inherited();
var _railBase = instance_create_layer(x, y, LAYER_BULLETS, oRailsAttack);
_railBase.rails_columns = 11;
_railBase.rails_lines = 3;
_railBase.actualPlayerPos = round(_railBase.rails_lines / 2);

boxDimensions(_railBase.rails_columns * _railBase.width, _railBase.rails_lines * _railBase.height)
genTimeVars(0, false, 9999, 0);
playerSetState(oSoul.stateSliding);

darkPosX = [room_width - 20, room_width - 60, room_width - 100];
darkN = 0;
myCircle = 0;

//Creates lamp deco
var _lamp1 = instance_create_layer(room_width + 120, 0, LAYER_EXTRAS_OBJECTS, oMineLamp);
var _lamp2 = instance_create_layer(room_width + 573, 0, LAYER_EXTRAS_OBJECTS, oMineLamp);
var _lamp3 = instance_create_layer(room_width + 231, room_height - 75, LAYER_EXTRAS_OBJECTS, oMineLamp);
var _lamp4 =instance_create_layer(room_width + 705, room_height  - 75, LAYER_EXTRAS_OBJECTS, oMineLamp);

lamps = [_lamp1.id, _lamp2.id, _lamp3.id, _lamp4.id];
lampTimer = [200, 500, 600, 1100];
lampNumber = 0;