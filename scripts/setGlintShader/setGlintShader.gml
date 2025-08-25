function setGlintShader(draw = false, r = 0, g = 0, b = 0)
{
	shader_set(shd_glint);

	// associa texture del glint allo stage 1
	var glint = sprite_get_texture(s_glint, 0);
	texture_set_stage(1, glint);

	var _offsetX = abs(cos(current_time / 300) * 5);
	var _offsetY = abs(sin(current_time / 300) * 5);

	_offsetX = clamp(_offsetX, 0, 5);

	// uniform dello shader
	shader_set_uniform_f(shader_get_uniform(shd_glint, "u_offset"), _offsetX * 10, _offsetY * 10);
	shader_set_uniform_f(shader_get_uniform(shd_glint, "u_angle"), 0.5);
	shader_set_uniform_f(shader_get_uniform(shd_glint, "u_scale"), 0.5);
	shader_set_uniform_f(shader_get_uniform(shd_glint, "u_tint"), abs(_offsetX) + r, abs(_offsetX) / 2 + g, abs(_offsetX) + b, 1.0);
	var _str = _offsetX;
	_str = clamp(_str, 0.1, 0.1);
	shader_set_uniform_f(shader_get_uniform(shd_glint, "u_strength"), 0.1);

	if (draw == true) {
		// disegna sprite
		draw_sprite(sprite_index, image_index, x, y);		
	}
}