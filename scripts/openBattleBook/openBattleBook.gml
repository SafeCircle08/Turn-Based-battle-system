function openBattleBook()
{
	if (!instance_exists(oBattleInvBookManager)) 
	{
		instance_create_layer(x, y, LAYER_EFFECT_TOP, oBattleInvBookManager);	
	}
}