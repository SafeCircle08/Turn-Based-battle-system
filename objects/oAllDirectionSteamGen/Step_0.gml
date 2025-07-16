event_inherited();
randomize();

//global.boxOriginX += 0.05;

if (timerGetCoord > 0) { timerGetCoord-- }

casualX = irandom_range(1, numberOfTubesWidth);
casualY = irandom_range(1, numberOfTubesHeight);

if (timerGetCoord == 0)
{
	tubeY =	((global.boxOriginY - (global.borderHeight) / 2) + width * casualY);
	tubeX = ((global.boxOriginX - (global.borderWidth) / 2) + width * casualX);

	allDirectionSteam = 
	[
		//THE OBJECTS
		[
			[oBulletSteamLeft, oBulletSteamLeft, oBulletSteamLeft],
			[oBulletSteamRight, oBulletSteamRight, oBulletSteamRight],
			[oBulletSteamDown, oBulletSteamDown, oBulletSteamDown],
			[oBulletSteam, oBulletSteam, oBulletSteam],
		],
		//THE X COORDINATES
		[
			[(global.boxOriginX + (global.borderWidth) / 2) + 8, (global.boxOriginX + (global.borderWidth) / 2) + 8, (global.boxOriginX + (global.borderWidth) / 2) + 8], //LEFT
			[(global.boxOriginX - (global.borderWidth) / 2) - 8, (global.boxOriginX - (global.borderWidth) / 2) - 8, (global.boxOriginX - (global.borderWidth) / 2) - 8], //RIGHT
			[tubeX  - 10, tubeX - 10 , tubeX - 10], //UP
			[tubeX - 10, tubeX - 10, tubeX - 10], //DOWN
		],
		//THE Y COORDINATES
		[
			[tubeY - 10, tubeY - 10, tubeY - 10], //LEFT 
			[tubeY - 10, tubeY - 10, tubeY - 10], //RIGHT 
			[(global.boxOriginY - (global.borderHeight) / 2) + 10, (global.boxOriginY - (global.borderHeight) / 2) + 10, (global.boxOriginY - (global.borderHeight) / 2) + 10], //UP
			[(global.boxOriginY + (global.borderHeight) / 2) + 10, (global.boxOriginY + (global.borderHeight) / 2) + 10, (global.boxOriginY + (global.borderHeight) / 2) - 10], //DOWN
		]
	];
}

if (global.enemyTimer % 160 == 0)
{
	createExclamationMarks();
	createRandomKnife();
}

if (global.created == false)
{
	if (global.createTimer > 0) { global.createTimer-- };
	
	if (global.createTimer == 0)
	{	
		for (var i = 0; i < 3; i++)
		{	
			var _actualBullet = irandom_range(0, 3);
			var _steamy = instance_create_layer
			(
				allDirectionSteam[1][_actualBullet][i],
				allDirectionSteam[2][_actualBullet][i],
				LAYER_BULLETS,
				allDirectionSteam[0][_actualBullet][i]	
			);
			_steamy.acceleration = false;
			if (i == 1) { global.bulletsCreated++; global.createTimer = 40; } 
		}
		if (global.bulletsCreated == 4) { global.bulletsCreated = 0; }
	}	
}
