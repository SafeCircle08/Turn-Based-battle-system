showingInv = false;
canFadeInv = true;

fadingIn = true;
fadedIn = false;
fadingOut = false;

xAdder = 0;
xAdderRef = 50;
drawAlpha = 0;
drawAlphaAdder = 0.05;
xAdderAdder = 7;
placeItemTimer = 2;

goldCost = 0;
placedItem = undefined;

finishedEnchanting = false;
itemSpriteX = 108 - xAdderRef;
itemSpriteY = MAIN_BATTLE_MENU_Y + 32
enchantedItemX = itemSpriteX + 123;
enchantedItemY = itemSpriteY;

createBaseFX = function() { 
	instance_create_layer(enchantedItemX + xAdder - 17, itemSpriteY - 18, LAYER_UNDER_EFFECT, oEnchBaseFX); 
}

removeBaseFX = function() {
	if (instance_exists(oAlphaSinFX)) {
		instance_destroy(oAlphaSinFX);
		instance_destroy(oEnchBaseFX);
	}
}

placeItem = function()
{
	placeItemTimer = setTimer(placeItemTimer);
	if (placeItemTimer == 0)
	{
		if (keyboard_check_pressed(vk_enter)) && (placedItem == undefined)
		{
			var _selectedItem = global.equippedItems[oBattleManager.selected_option];

			createBaseFX();
			var _enchN = array_length(_selectedItem.enchants);
			goldCost = irandom_range(200, 400) + (100 ^ _enchN * 2)
			placedItem = _selectedItem;
			showingInv = false;
			placeItemTimer = 2;
		}
	}
}

removeItem = function() {
	placedItem = undefined; removeBaseFX(); 
}	

playerHasGold = function() {
	return global.playerGold >= goldCost;	
}

confirmEnchant = function()
{
	if (playerHasGold()) && (array_length(placedItem.enchants) + 1 < 4) {
		finishedEnchanting = true;
		enchantItem(placedItem);
		global.playerGold -= goldCost;
		terminateAction(["<>You enchanted an Item.\n<>You'll be able to use it\n  next turn."]);
		removeBaseFX();
		fadingOut = true;
	}
}

setToStartStateItemVars = function()
{
	removeItem();
	removeBaseFX();
	placeItemTimer = 2;
}

setTofadeIn = function()
{
	fadingOut = false;
	fadedIn = false;
	fadingIn = true;
}

setToFadeOut = function()
{
	fadedIn = true;
	fadingOut = true;		
}

fadeIn = function() {
	var _maxXAdder = xAdderRef;
	if (xAdder < xAdderRef) { xAdder += xAdderAdder; }
	if (drawAlpha < 1) { drawAlpha += drawAlphaAdder; }
	if (xAdder == _maxXAdder) && (drawAlpha == 1) { fadedIn = true; }
	xAdder = clamp(xAdder, 0, xAdderRef);
}
fadeOut = function() {
	if (xAdder > 0) { xAdder -= xAdderAdder; }
	if (drawAlpha > 0) { drawAlpha -= drawAlphaAdder; }
	if (drawAlpha <= 0) { instance_destroy(self); }
	xAdder = clamp(xAdder, 0, xAdderRef);
}