draw_self();

var _x = oPlayerOW.x + camera_get_view_width(view_camera[view_current]) / 2;
var _y = oPlayerOW.y + camera_get_view_height(view_camera[view_current]) / 2;

draw_set_color(c_black);

draw_set_alpha(myAlpha + 0.5);
draw_rectangle(0, 0, _x, _y + 50, false);

//Reset the values
draw_set_alpha(1);
draw_set_color(c_white);