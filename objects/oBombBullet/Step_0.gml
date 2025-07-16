yEsponent += 0.05;
y += 5 ^ yEsponent ;

if (y >= global.border_u) { explosionTimer = 0; }

if (explosionTimer == 0)
{
	for (var i = 0; i < 13; i++)
	{
		iNote = instance_create_layer(x, y, LAYER_BULLETS, oNoteBullet);
		iNote.image_angle = i * 30;
		iNote.len = 1;
	}
	instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oBombExplosion);
	instance_destroy(self);
}