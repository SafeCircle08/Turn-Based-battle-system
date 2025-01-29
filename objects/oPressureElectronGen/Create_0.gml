event_inherited();

global.generatorPhase = -1;

genTimeVars(50, false, 1300, false);
boxDimensions(260, 100);

timer = 100;

oSoul.state = oSoul.stateFree;

instance_create_layer(x, y, "Bullets", oBlasterGenerator);
instance_create_layer(10, 125, "Bullets", oRectangleIndicator);
instance_create_layer(10, 125, "Bullets", oSupportPlayerHitBox_2);