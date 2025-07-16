if (delay > 0) { delay--; }
if (delay == 0)
{
	instance_create_layer(xPos, yPos, LAYER_EXPLOSION, oSparks);
	numOfSparks += 1;
	delay = 2;
}

if (numOfSparks >= sparksNum) { instance_destroy(self); }