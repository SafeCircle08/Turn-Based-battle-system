//This shows the inventory not for using the item, 
//but for selecting them into the enchanting table
if (showingInv)
{
	with (oBattleManager)
	{
		if (other.canFadeInv) { inventoryFadeIn(); }
		else { inventoryFadeOut(); } 
		navigatingInventoryFunction();
	}
} else { with (oBattleManager) { inventoryFadeOut(); } }
