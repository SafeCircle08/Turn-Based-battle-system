draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_set_alpha(image_alpha)

draw_text_ext_transformed(x - 1, y - 1, "+" + string(showDamage), 1, 100, image_xscale + 0.5, image_yscale + 0.5, image_angle);
draw_set_color(c_red);
draw_text_ext_transformed(x, y, "+" + string(showDamage), 1, 100, image_xscale + 1, image_yscale + 1, image_angle);
if (adderDamage != 0)
{
	var _length = string_length(showDamage);
	draw_set_color(c_yellow);
	draw_text_ext_transformed(x + 30, y, "(+" + string(adderDamage) + ")", 1, 100, image_xscale + 0.5, image_yscale + 0.5, image_angle - 20);
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);