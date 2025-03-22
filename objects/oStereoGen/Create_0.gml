event_inherited();

boxDimensions(150, 150);
genTimeVars(0, false, 850, 0);
playerChangeState(oSoul.stateFree, sNoEffects);

stereoLeft = instance_create_layer(global.boxOriginX - 70, global.boxOriginY - 20, "Bullets", oStereo);
stereoLeft.image_xscale = 1;
stereoLeft.angles = [0, 30, 0, -30];
stereoLeft.frameSign = -1;
stereoLeft.xAdder = 10;
stereoLeft.yAdder = 0;
with(stereoLeft)
{
	stereoStepEvent = function()
	{
		frame += 0.02 * (sign(frameSign))
		x = ((cos(frame) * sign(frameSign)) + 25) + xAdder;
		y = ((sin(frame) * 30 + 100)) + yAdder;

		if (actualTimer > 0) { actualTimer--; }
		image_index = clamp(image_index, 0, image_number);

		if (image_index == image_number) { image_index = 0 }

		if (image_index == 4)
		{
			var _angles = angles;
			for (var i = 1; i < 4; i++)
			{
				triangle = instance_create_layer(x, y, "Instances", oNoteBullet);
				triangle.image_angle = _angles[i];
			}
		}
	}		
}
cannonHorizontal = instance_create_layer(x, y, "Bullets", oBlasterLineGenerator);
setLineBlasterPos
(
	cannonHorizontal,
	[room_width + 70],
	[global.boxOriginY, global.boxOriginY + 40, global.boxOriginY - 40],
	[room_width - 80],
	[global.boxOriginY, global.boxOriginY + 40, global.boxOriginY - 40],
	"horizontal",
	1
);