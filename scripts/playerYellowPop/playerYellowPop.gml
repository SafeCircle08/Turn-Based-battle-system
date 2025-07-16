function playerYellowPop()
{
	shader_set(shYellowPop);
	
	var t = clamp(timer / duration, 0, 1);
	timer += 1;
	if (timer >= duration) && (yellowPopping)
	{
	    yellowPopping = false;
		timer = 0;
	}	
	
	if (t < 0.5) {
	    t = t * 2;
	} else {
	    t = (1.0 - t) * 2;
	}	
	
	shader_set_uniform_f(shader_get_uniform(shYellowPop, "u_time"), t);
	
	draw_self();
	shader_reset();
}