event_inherited();
timer_1 = 1000;
timer_2 = 700;
timer_3 = 700;
timerSpecial = [950, 850, 750, 700, 600, 580, 560, 540, 520, 500, 480, 440, 420, 400, 380, 360, 340, 320];
timerIndex = 0;
tanVariable = -5;
tanVariableSign = 1;
finalTimer = timer_1 + timer_2 + timer_3;
boxDimensions(80, room_height);
setBoxOrigin(room_width / 2, room_height / 2);
genTimeVars(0, false, 2400, 0);
playerChangeState(oSoul.stateUmbrella, sUmbrellaEffect);
instance_create_layer(x, y, "Bullets", oDocumentWave);
oBackGround.canScroll = true;
var _orX = global.boxOriginX;
var _orY = global.boxOriginY;

electroLUp = instance_create_layer(x, y, "Bullets", oElectricity);
electroLUp.distanceX = -(global.borderWidth / 2) + 10;
electroLUp.distanceY = -72;

electroLDown = instance_create_layer(x, y, "Bullets", oElectricity);
electroLDown.distanceX = -(global.borderWidth / 2) + 10;
electroLDown.distanceY = +72;

electroRUp = instance_create_layer(x, y, "Bullets", oElectricity);
electroRUp.distanceX = (global.borderWidth / 2) - 10;
electroRUp.distanceY = -72;
electroRUp.image_xscale = -1;

electroRDown = instance_create_layer(x, y, "Bullets", oElectricity);
electroRDown.distanceX = (global.borderWidth / 2) - 10;
electroRDown.distanceY = +72;
electroRDown.image_xscale = -1;

cannonHorizontal = instance_create_layer(x, y, "Bullets", oBlasterLineGenerator);
cannonHorizontal.specific = true;
setLineBlasterPos
(
	cannonHorizontal,
	//Possible X Pos
	[
		-70,
		-70, 
		room_width + 70,
		room_width + 70,
		
		-70,
		-70, 
		room_width + 70,
		room_width + 70,
		
		-70, 
		room_width + 70,
		
		-70,
		-70, 
		room_width + 70,
		room_width + 70,
		
		-70,
		-70,
		-70,
		-70,
		-70,
		-70,
		-70,
		
		room_width + 70,
		room_width + 70,
		room_width + 70,
		room_width + 70,
		room_width + 70,
		room_width + 70,
		room_width + 70,
	],
	//Possible Y Pos
	[
		_orY - 80,
		_orY + 80,
		_orY - 80,
		_orY + 80,
		
		_orY - 40,
		_orY + 40,
		_orY - 40,
		_orY + 40,
		
		_orY,
		_orY,

		_orY - 40,
		_orY + 40,
		_orY - 40,
		_orY + 40,
		
		_orY - 100,
		_orY - 75, 
		_orY - 50,
		_orY - 25,
		_orY,
		_orY + 25,
		_orY + 50,
		
		_orY + 100,
		_orY + 75,
		_orY + 50,
		_orY + 25,
		_orY,
		_orY - 25,
		_orY - 50
		
	], 
	//Target X
	[
		50, 
		50, 
		room_width - 50,
		room_width - 50,
		
		50, 
		50, 
		room_width - 50,
		room_width - 50,
		
		50, 
		room_width - 50,
		
		50, 
		50, 
		room_width - 50,
		room_width - 50,
		
		50, 
		50,
		50,
		50,
		50,
		50,
		50,

		room_width - 50,
		room_width - 50,
		room_width - 50,
		room_width - 50,
		room_width - 50,
		room_width - 50,
		room_width - 50,
	],
	//Target Y
	[
		_orY - 80,
		_orY + 80,
		_orY - 80,
		_orY + 80,
		
		_orY - 40,
		_orY + 40,
		_orY - 40,
		_orY + 40,
		
		_orY,
		_orY,
		
		_orY - 40,
		_orY + 40,
		_orY - 40,
		_orY + 40,
		
		_orY - 100,
		_orY - 75,
		_orY - 50,
		_orY - 25,
		_orY,
		_orY + 25,
		_orY + 50,
		
		_orY + 100,
		_orY + 75,
		_orY + 50,
		_orY + 25,
		_orY,
		_orY - 25,
		_orY - 50
	],
	//Facing
	"horizontal",
	//Blaster Num 
	[
		4, 4, 2, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	]
);