draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(image_alpha);
draw_set_color(c_red);
draw_text(x + 1, y, value);
draw_text(x - 1, y, value);
draw_text(x, y + 2, value);
draw_text(x, y - 2, value);
draw_sprite(sBloodDrop, damageIndex, x + 15, y - 8);
draw_set_color(c_black);

draw_set_alpha(1.0);
draw_text(x, y - 1, value);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fGenericText);
