draw_self();

var _x = room_width / 2; 
var _y = room_height / 4;

//draw_text(_x - 70, _y, "Frame image angle: " + string(angle_test)); //runs 60 fps
//draw_text(_x - 70, _y + 20, "Delta image angle: " + string(image_angle)); //runs by time

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _x = room_width / 2;
var _y = 10;
var _sprW = sprite_get_width(sTimeBar);
var _sprH = sprite_get_height(sTimeBar);

draw_set_color(c_white);

draw_sprite_ext(sTimeBar, 0, _x, _y - 5, leftBarW, 1, 0, c_white, image_alpha);
draw_sprite_ext(sTimeBar, 0, _x, _y - 5, rightBarW, 1, 0, c_white, image_alpha);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);