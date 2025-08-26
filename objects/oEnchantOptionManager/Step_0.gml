if (keyboard_check_pressed(vk_enter)) && (placedItem != undefined) { confirmEnchant(); }

if (mouse_check_button_pressed(mb_right))
{ 
	if (mouseCursorIsOn(
		itemSpriteX + xAdder, 
		itemSpriteY, 
		itemSpriteX + 32 + xAdder, 
		itemSpriteY + 32)
	) { removeItem(); }
}

if (showingInv)
{
	with (oBattleManager)
	{
		if (other.canFadeInv) { inventoryFadeIn(); }
		else { inventoryFadeOut(); } 
		navigatingInventoryFunction();
	}
	if (keyboard_check_pressed(vk_enter)) { placeItem(); }
} else { with (oBattleManager) { inventoryFadeOut(); } }

//Animationd
if (fadingIn == true) && (fadedIn == false) { fadeIn(); }
if (fadingOut == true) { fadeOut(); }