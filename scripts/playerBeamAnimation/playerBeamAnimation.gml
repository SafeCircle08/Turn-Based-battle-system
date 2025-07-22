//Utilities--------------------------------
function resetBeamAnimationVariables()
{
	global.beamAnimation = false;
	oSoul.beamTimer = 60; 
	with (oPlayerBeam)
	{
		oPlayerBeam.indexMax = 0;
		oPlayerBeam.beamHeight = 300;			
	}
}

function finishBeamAnimation() 
{
	resetBeamAnimationVariables(); 
}

function startTurn() { return (global.enemyTimer < 100); }
function endTurn() { return (global.enemyTimer > global.enemyAttackTime - 60); }


function beamStartTurnInit()
{
	x = global.boxOriginX + global.xOffset; 
	y = global.boxOriginY + global.yOffset;		
}

function beamEndTurn() { y = -100; }
//-----------------------------------------

//Used to actually start the beam animation.
//Just calling this function, will menage everything
function startBeamAnimation(startOfTurn = true) 
{ 
	if (startOfTurn == false) { destroyBulletsGensExtras(); }
	global.beamAnimationTimer = BEAM_ANIMATION_TIMER_REF;
}

//The actual function, that menage the
//player state, sprite, etc...
function playerBeamAnimation(_activatedDuringTurn = false, _newState = noone)
{
	//Creates the objects that manage everything
	if (!instance_exists(oPlayerBeam))
	{ 
		instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oPlayerBeam); 
	}
	
	//oSoul Variables set up
	with (oSoul)
	{
		beamTimer = setTimer(beamTimer);
		if (beamTimer == 30)
		{		
			if (_activatedDuringTurn == false)
			{
				if (startTurn()) { beamStartTurnInit(); }
				else { beamEndTurn(); }
			}
		}
		if (beamTimer <= 0) { finishBeamAnimation(); }
	}
	
	//Draws the beam
	with (oPlayerBeam)
	{
		beamHeight = clamp(beamHeight, 1, room_height + 1);
		indexMax += 0.28 * (delta_time / 1_000_000) * WANTED_FPS;
		draw_sprite_stretched(sBeam, indexMax, oSoul.x - 16 , 0, sprite_get_width(sBeam), beamHeight);
	}
	
}