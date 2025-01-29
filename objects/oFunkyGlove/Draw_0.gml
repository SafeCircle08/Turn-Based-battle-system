var _col = make_color_rgb(240, 0, 100)
draw_set_color(_col);
draw_line(x, y + 10, global.boxOriginX - ((global.borderWidth / 2) * sign(sinVerse)) - sign(sinVerse), global.boxOriginY);
draw_set_color(c_white);
draw_self();