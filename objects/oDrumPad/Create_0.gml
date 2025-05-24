randomize();
event_inherited();

angleAdderRef = 2;
angleAdder = angleAdderRef;
delay = 5;
angleSpeed = [2, 5, 3, 5];
rotDelay = 90 / angleSpeed[0]; //(90 / 2)

angleRound = 0;
image_angle = 0;
image_speed = 0;
image_xscale = 0.8;
image_yscale = 0.8;
animationTimer = 50;
animating = false;
canShoot = false;
actualDamage = 0;
damage = 0;

fact = 3;
leftBarW = -155;
rightBarW = 155;
global.playerAttackTimer = rightBarW * fact;
attackTime = global.playerAttackTimer - 1;
lAdder = leftBarW / attackTime;
rAdder = rightBarW / attackTime;

angles = [-90, 0, 90, 180];
badShellNum = 0;

//Metto in canna il numero di shell corrette
for (var i = 0; i < 4; i++)
{
	if (badShellNum < 2) && (irandom_range(0, 3) == 2)
	{
		actualShell = instance_create_layer(x, y, "Shells", oBadShell);	
		actualShell.adder = angles[i];
		badShellNum += 1;
		continue;
	}
	actualShell = instance_create_layer(x, y, "Shells", oShell);
	actualShell.adder = angles[i];
}

//Quando spari
onPressEnter = function(_damageAdder = 0)
{
	if (keyboard_check_pressed(vk_enter))
	{
		pressed = true;
		canShoot = false;
		
		with (oDrumPadScope)
		{
			var collidingShell = instance_place(x, y, oShell);
			var collidingWrongShell = instance_place(x, y, oBadShell);
			if (collidingWrongShell != noone) { game_end();	}
		
			//Se non collido con le schells giuste:
			if (collidingShell == noone)
			{ 
				audio_play_sound(sndEmptyChamber, 50, false);
				exit; 
			}
			
			//Animazione dell'ombrello
			if (other.animating == false) { other.animating = true; }
			else 
			{
				other.animating = false;
				other.animating = true;
			}
			
			//Danni, suoni ed effetti
			actualDamage = 100;
			other.damage += actualDamage + _damageAdder;
			if (_damageAdder != 0) { audio_play_sound(sndDing_1, 50, false); }
			audio_play_sound(sndShot, 60, false, global.soundGain);
			instance_create_layer(collidingShell.x, collidingShell.y - 15, "Explosion", oShellFalling);
			instance_create_layer(0, 0, "Instances", oShotAnimation);
			instance_create_layer(0, 0, "Scope", oFlash);
			instance_create_layer(collidingShell.x, collidingShell.y - 30, "Explosion", oExplosion);
			instance_create_layer(other.x, other.y - 25, "Explosion", oCircleEffect);
			instance_create_layer(x, y, "Explosion", oSparksManager);
			var _dmgText = instance_create_layer(x, y, "Explosion", oDrumPadText);
			_dmgText.showDamage = actualDamage;
			_dmgText.adderDamage = _damageAdder;
			
			instance_destroy(collidingShell);
		}
	}			
}