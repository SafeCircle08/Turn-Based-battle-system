function createNewPlayerStateInfo(
	_state, _startSpr, _fxSpr, _angle,
	_pov, _hbX, _hbY, _xOffSet, _yOffSet
)
{
	var _mystateInfos = {
		state: _state,
		startSprite: _startSpr,
		effectSpr: _fxSpr,
		angle: _angle,
		pov: _pov,
		hbX: _hbX,
		hbY: _hbY,
		xOffSet: _xOffSet,
		yOffSet: _yOffSet
	}
	return _mystateInfos;
}

function loadPlayerStateInfo()
{	
	global.playerStateFree     = createNewPlayerStateInfo(oSoul.stateFree,
					             sPlayerFront, sNoEffects, 0, "Up", 0, 2.5, 0, 0);
	
	global.playerStateMirrored = createNewPlayerStateInfo(oSoul.stateMirrored, sPlayerFrontMirrored, 
								 sInvertedEffect, 0, "Up", 0, 2.5, 0, 0);
	
	global.playerStateGravity  = createNewPlayerStateInfo(oSoul.stateGravity, JUMP_SPRITE, 
								 sEffectGravity, 0, "Up", 0, 0, 0, 0);

	global.playerStateSpider   = createNewPlayerStateInfo(oSoul.stateSpider, sPlayerSpiderLeft, 
							     sSpiderEffect, 0, "Up", 0, 2.5, 0, 0);
	
	global.playerUsingUmbrella = createNewPlayerStateInfo(oSoul.stateGravity, sPlayerUmbrella, 
							     sUmbrellaEffect, 0, "Up", 0, 0, 0, 0);
}