function dpShoot(_damageAdder)
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
			instance_create_layer(collidingShell.x, collidingShell.y - 15, LAYER_EXPLOSION, oShellFalling);
			instance_create_layer(0, 0, "Instances", oShotAnimation);
			instance_create_layer(0, 0, LAYER_SCOPE, oFlash);
			instance_create_layer(collidingShell.x, collidingShell.y - 30, LAYER_EXPLOSION, oExplosion);
			instance_create_layer(other.x, other.y - 25, LAYER_EXPLOSION, oCircleEffect);
			instance_create_layer(x, y, LAYER_EXPLOSION, oSparksManager);
			var _dmgText = instance_create_layer(x, y, LAYER_EXPLOSION, oDrumPadText);
			_dmgText.showDamage = actualDamage;
			_dmgText.adderDamage = _damageAdder;
			
			instance_destroy(collidingShell);
		}
	}	
}