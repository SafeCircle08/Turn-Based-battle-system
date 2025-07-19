draw_self();


if (global.beamAnimation) { playerBeamAnimation(); }

if (flashAlpha > 0)
{
	shader_set(shWhiteEffect);	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle,
					flashColor, flashAlpha);
	shader_reset();
}

if (yellowPopping) { playerYellowPop(); }