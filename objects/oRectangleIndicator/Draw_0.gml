draw_self();

var _xx = x + 3;
var _yy = y + 5;
var _actualWeight = "Weight: " + string(weight);
var _weightLimit = "! Limit = 100 !";

draw_set_font(fText);
draw_set_color(c_white);
draw_text_ext_transformed(_xx, _yy, _actualWeight, 10, 200, 0.4, 0.45, image_angle);

draw_set_color(c_red);
draw_text_ext_transformed(_xx, _yy + 8, _weightLimit, 10, 200, 0.4, 0.45, image_angle);

draw_set_color(c_white);
draw_set_font(fGenericText);