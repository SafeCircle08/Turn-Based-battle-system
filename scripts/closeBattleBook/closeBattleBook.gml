function closeBattleBook()
{
	if (instance_exists(oBattleInvBookManager))
	{
		oBattleInvBookManager.fadingOut = true;	
	}
}