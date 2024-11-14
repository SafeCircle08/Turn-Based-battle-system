event_inherited();

if (global.created == false)
{
	if (global.createTimer > 0) { global.createTimer-- };
	
	if (global.createTimer == 0)
	{
		instance_create_layer(global.bulletKind[0][1][global.bulletsCreated], global.bulletKind[0][2][global.bulletsCreated], "Bullets", oBullet);
		global.createTimer = 60;
		global.bulletsCreated++;
	}
	if (global.bulletsCreated == 2) { global.created = true };	
}