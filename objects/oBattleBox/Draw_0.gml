draw_self();

var _col = make_color_rgb(240, 0, 100)

global.border_l = (global.boxOriginX - (currentWidth / 2));
global.border_r = (global.boxOriginX + (currentWidth / 2)) 
global.border_u = (global.boxOriginY - (currentHeight / 2)) 
global.border_d = (global.boxOriginY + (currentHeight / 2))

draw_set_color(_col);

if (animateBoxTimer == 0) && global.pov == "Up"
{
	draw_sprite_stretched_ext
	(
		sOutSideBox, 
		0, 
		global.boxOriginX - (global.borderWidth / 2) - 20, 
		global.boxOriginY - (global.borderHeight / 2) - 20, global.borderWidth + 41, 
		global.borderHeight + 41, 
		_col, 
		1
	);
}

draw_rectangle(global.border_l - 4, global.border_u - 4, global.border_r + 4, global.border_d + 4, false);
draw_set_color(c_black);
draw_rectangle(global.border_l, global.border_u, global.border_r, global.border_d, false);
draw_sprite_ext(sCenter, 0, global.boxOriginX + global.xOffset, global.boxOriginY + global.yOffset, 1, 1, image_angle, _col, 1);
draw_sprite(sRedCross, 0, global.boxOriginX + global.xOffset, global.boxOriginY + global.yOffset + 1.5);

/*oSoul.x = clamp(oSoul.x, global.border_l + 8, global.border_r - 7);
oSoul.y = clamp(oSoul.y, global.border_u + 8, global.border_d - 9);
/*

oSoul.x = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
oSoul.y = clamp(oSoul.y, global.border_u + 10, global.border_d - 9);

//HITBOX DEL PLAYER IN FORMA FISICA	
oSoul.x = clamp(oSoul.x, global.border_l + 5, global.border_r - 4);
oSoul.y = clamp(oSoul.y, global.border_u + 10, global.border_d - 9);