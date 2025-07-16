alphaTimer++;

image_xscale += xScaleAdder;
image_yscale += yScaleAdder;
image_angle += 1;

if (alphaTimer % 10 == 0)
{
	var _spark = instance_create_layer(x, y, LAYER_EXPLOSION, oSparks)
	_spark.image_blend = c_red;
	if (adderDamage != 0) { _spark.image_blend = c_yellow; }
	_spark.x = x;
	_spark.y = y;
	_spark.image_xscale = 0.3;
	_spark.image_yscale = image_xscale;
	_spark.vspeed = -2;
	_spark.hspeed = sign(hspeed) * 1;
	_spark.gravity = 0.05;
}

if (alphaTimer >= 20)
{
	image_alpha-= 0.01;	
	if (image_alpha <= 0) { instance_destroy(self); }
}