//Spawn Umbrella state (starts the turn with umbrella state)
function stateUmbrellaLoad(){
	t = 0;
	stateUmbrella = function()
	{
		stateInit(sPlayerUmbrella, sUmbrellaEffect, "Front");
		hbY = -11;
		hbX = -2;
		t += 0.05;
		yFloating = sin(t) * 2;	

		//Setting the horizontal speed
		hsp = (key_right - key_left) * global.SoulSpeed;
		vsp = (key_down - key_up) * global.SoulSpeed;
	
		x += hsp * (delta_time / 1_000_000) * WANTED_FPS;
		y += vsp + (yFloating / 10) * (delta_time / 1_000_000) * WANTED_FPS;
	}
}