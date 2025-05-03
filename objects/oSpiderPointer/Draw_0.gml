draw_self();

if (oSoul.flashAlpha > 0)
{
	shader_set(shWhiteEffect);
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle,
					oSoul.flashColor, oSoul.flashAlpha);
	shader_reset();
}