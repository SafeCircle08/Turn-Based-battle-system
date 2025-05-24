function createSpiderTrail(_angle, _layer = "ExtrasObjects")
{
	var _sprHeight = sprite_get_height(sSpiderTrail);
	image_speed = 0;
	instance_create_layer(self.x, self.y, _layer, oSpiderTrail,
	{ image_xscale: 0.5, image_yscale: global.borderHeight / _sprHeight, image_angle: _angle });
	instance_create_layer(self.x + irandom_range(-2, 2), self.y + irandom_range(-2, 2), _layer, oCirclePop);
}