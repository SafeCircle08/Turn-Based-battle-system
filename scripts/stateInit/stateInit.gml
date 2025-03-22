function stateInit(_sIndex, _newState, _stateSprite)
{
	if (global.playerMoveTimer == -1)
	{
		sprite_index = _sIndex;
		playerChangeState(_newState, _stateSprite);
		global.playerMoveTimer = -2;
	}
}