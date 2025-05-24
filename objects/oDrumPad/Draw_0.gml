draw_self();

draw_rectangle(x - 50, y - 110, x + 50, y - 90, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fText);

var _x = room_width / 2;
var _y = room_height;
var _sprW = sprite_get_width(sTimeBar);
var _sprH = sprite_get_height(sTimeBar);

draw_set_color(c_white);
draw_text(x, y - 99, damage);

draw_sprite_ext(sTimeBar, 0, _x, _y - 5, leftBarW, 1, 0, c_white, 1);
draw_sprite_ext(sTimeBar, 0, _x, _y - 5, rightBarW, 1, 0, c_white, 1);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);