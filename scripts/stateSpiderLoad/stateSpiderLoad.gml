function createSpiderTrail(_angle, _layer = LAYER_EXTRAS_OBJECTS)
{
	var _sprHeight = sprite_get_height(sSpiderTrail);
	image_speed = 0;
	instance_create_layer(self.x, self.y, _layer, oSpiderTrail,
	{ image_xscale: 0.5, image_yscale: global.borderHeight / _sprHeight, image_angle: _angle });
	instance_create_layer(self.x + irandom_range(-2, 2), self.y + irandom_range(-2, 2), _layer, oCirclePop);
	return;
}


function stateSpiderLoad(){
	spiderState = 0;
	trailLength = 0;
	flickTimer = 50;
	
	stateSpider = function()
	{
		#region STATE INIT + BASIC MOVEMENT
		stateInit(sPlayerSpiderRight, sSpiderEffect, "SpiderPov");
		if (!instance_exists(oSpiderPointer)) { pointer = instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oSpiderPointer); }
		hsp = (key_right - key_left) * global.SoulSpeed;
		if (hsp == 0) { image_speed = 0; image_index = 0; }
		#endregion
		#region SPIDER MOVEMENT (KEYS AND COLLISIONS)
		//Quando sono con lo spider a terra
		if (spiderState == 0)
		{
			//La piattaforma di base
			gravCreateRightGravityBorder(oBoxSidePlaftorm_D);
		
			//Basic Movement
			if (key_left) { sprite_index = sPlayerSpiderLeft; image_speed = 1; }
			if (key_right) { sprite_index = sPlayerSpiderRight; image_speed = 1; }
			//y = global.border_d + 1;
			pointer.y = global.border_u;
			pointer.image_angle = 0;
			hbX = 0;
			hbY = -10;
		
			//Se sono su una piattaforma ma 
			//"Scivolo" o ci cado:
			if (!place_meeting(x, y + 1, oPlatformParent)) 
			{ 
				y = global.border_d + 1; 
				createSpiderTrail(0);
			}
		
			//Se premo per andare in su
			if (key_up)
			{
				//Aggiunge uno fino a quando raggiono il bottomo del box
				while (y > global.border_u)
				{
					//Se collido esco
					if (place_meeting(x, y - 1, oPlatformParent))
					{
						createSpiderTrail(180);
						break; 
					}
					y--;
				}
			
				//Setto le condizioni giusto della rotazione del player
				image_angle = 180;
				spiderState = 1;
				flashAlpha = 1;
			}
		}
		else
		{
			//La piattaforma di base
			gravCreateRightGravityBorder(oBoxSidePlaftorm_U);
		
			//Basic Movement
			if (key_left) { sprite_index = sPlayerSpiderRight; image_speed = 1; }
			if (key_right) { sprite_index = sPlayerSpiderLeft; image_speed = 1; }
			pointer. y = global.border_d + 1;
			pointer.image_angle = 180;
			hbX = 0;
			hbY = 10;

			//Se sono su una piattaforma ma 
			//"Scivolo" o ci cado:
			if (!place_meeting(x, y - 2, oPlatformParent)) 
			{ 
				y = global.border_u; 
				createSpiderTrail(180);
			}
		
			//Se premo per andare in basso:
			if (key_down)
			{
				//Aggiungo sempre di uno
				while (y < global.border_d + 1)
				{
					//Se collido esco
					if (place_meeting(x, y, oPlatformParent))
					{
						createSpiderTrail(0);
						break; 
					}
					y++;	
				}
			
				//Setto le nuove condizioni di rotazione
				image_angle = 0;
				spiderState = 0;
				flashAlpha = 1;
			}
		}	
		#endregion
	
		if (flashAlpha > 0) 
		{ 
			flashAlpha -= 0.05; 
		}
	
		x += hsp;
		var _possX = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
		oSoul.x = _possX;
	}
}