event_inherited();

global.generatorPhase = -1;
genTimeVars(50, false, 1300, false);
boxDimensions(260, 100);
playerChangeState(oSoul.stateFree);

timer = 100;

cannonHorizotal = instance_create_layer(x, y, LAYER_BULLETS, oBlasterLineGenerator);
setLineBlasterPos
(
	cannonHorizotal,
	[-200, -200],
	[global.boxOriginY + 35, global.boxOriginY - 35],
	[50, 50],
	[global.boxOriginY + 35, global.boxOriginY - 35],
	"horizontal",
	1
);
instance_create_layer(10, 187, LAYER_BULLETS, oRectangleIndicator);
instance_create_layer(10, 125, LAYER_BULLETS, oSupportPlayerHitBox_2);