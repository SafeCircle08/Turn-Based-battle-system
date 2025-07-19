key_right = keyboard_check(ord("D")); 
key_left = keyboard_check(ord("A")); 
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

global.playerHP = clamp(global.playerHP, -666, global.playerMAX_HP);

if (oBattleBox.visible == false) 
{ 
	x = global.boxOriginX;
	y = -10;
	exit; 
}

//I am animating the beam
if (global.beamAnimationTimer > 0)
{
	global.beamAnimationTimer--;
	global.beamAnimation = true; //-> playerBeamAnimation();
}

//The turn is finishing (playing beam animation) so we dont call the state
if (global.enemyTimer > global.enemyAttackTime - 60) { exit; }

//When im done animating the beam
if (global.beamAnimationTimer < BEAM_ANIMATION_TIMER_REF / 2) { state(); }