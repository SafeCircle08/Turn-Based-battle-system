event_inherited();

var _x = room_width / 2;
var _y = room_height / 2 - 10;
initializeNewTurn(0, false, 750, 0, 170, 100, _x, _y, oSoul.stateFree);

frame = 0;
delayTimer = 10;
maxElectrons = 12;
angleMultiplier = 360 / maxElectrons;
electronN = 0;
timer = 0;