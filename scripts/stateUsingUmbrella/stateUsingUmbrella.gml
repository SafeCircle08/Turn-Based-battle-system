//Called during the turn. (ex. when you are under the gravity effect)
function stateUsingUmbrella(){
	usingUmbrella = function()
	{
		if (umbrellaJump == false)
		{
			vsp = -10;
			umbrellaJump = true;
			effect = instance_create_layer(oSoul.x, oSoul.y, LAYER_EXTRAS_OBJECTS, oPlayerEffect);
			effect.sprite_index = sUmbrellaEffect;
		}
		grav = 0.300;
		vsp = clamp(vsp, -7, 1.5);
		sprite_index = sPlayerUmbrella;
	}	
}