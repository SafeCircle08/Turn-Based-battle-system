function playerBeamAnimation()
{
	if (global.beamAnimation == true)
	{
		if (global.playerMoveTimer > 0)
		{
			beamHeight = clamp(beamHeight, 1, room_height + 1)
			indexMax += 0.28;
			oSoul.visible = false;
			draw_sprite_stretched(sBeam, indexMax, oSoul.x - 16 , 0, sprite_get_width(sBeam), beamHeight);	
		}
	}
}