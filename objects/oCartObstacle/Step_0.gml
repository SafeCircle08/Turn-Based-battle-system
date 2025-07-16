x -= spd;
outSideWindow(self, sprite_index);

if (oRailsAttack.frame % 50 == 0)
{
	var _myEffect = instance_create_layer(self.x, self.y, LAYER_EXPLOSION, oCartObstacleEffect);
	_myEffect.callerId = id;
}