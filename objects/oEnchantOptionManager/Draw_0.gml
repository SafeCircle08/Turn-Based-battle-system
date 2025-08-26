var _border = 5;
var _enchBGX = MAIN_BATTLE_MENU_X + _border - xAdderRef; 
var _enchBGY = MAIN_BATTLE_MENU_Y;
var _enchBGH = sprite_get_width(sEnchantSystemBG);
draw_set_alpha(drawAlpha);
draw_sprite(sEnchantSystemBG, 0, _enchBGX + xAdder, _enchBGY);

var _enchLevelX = 185 - xAdderRef;
var _enchLevelY = 105;
var _goldCostX = 135 - xAdderRef;
var _goldCostY = 114;

draw_set_font(fHungrySkinny);

//Draws the enchant properties
if (placedItem != undefined)
{
	var _enchantsOnTheItem = array_length(placedItem.enchants);
	var _enchLevel = _enchantsOnTheItem;
	print(_enchantsOnTheItem);
	var _enchLevelStr = _enchLevel;
	
	if (_enchLevel + 1 < 4) { _enchLevelStr = string(_enchLevel) + " (+1)"; }
	draw_text_transformed(_enchLevelX + xAdder, _enchLevelY, string(_enchLevelStr), 0.5, 0.5, 0);
	draw_text_transformed(_goldCostX + xAdder, _goldCostY, string(goldCost), 0.5, 0.5, 0);
	if (_enchLevel == 3) {
		draw_set_color(c_red);
		draw_text_transformed(_enchLevelX + xAdder + 10, _enchLevelY, "(!)", 0.5, 0.5, 0);		
		draw_set_color(c_white);
	}
	
	if (mouseCursorIsOn(itemSpriteX + xAdder, itemSpriteY, itemSpriteX + 31 + xAdder, itemSpriteY + 32)) {
		draw_rectangle(itemSpriteX + xAdder - 3, itemSpriteY - 3, itemSpriteX + 34 + xAdder, itemSpriteY + 34, true);		
	}
	
	//Draws the placed Item
	var _placedItemX = 108 - xAdderRef;
	var _placedItemY = _enchBGY + 32;
	draw_sprite(placedItem.sprite, 0,itemSpriteX + xAdder, itemSpriteY);
	
	//Draws the enchanted Item
	setGlintShader();
	draw_sprite(placedItem.sprite, 0, enchantedItemX + xAdder, itemSpriteY);
	shader_reset();
} else {
	//N/A values
	draw_text_transformed(_enchLevelX + xAdder, _enchLevelY, "N/A", 0.5, 0.5, 0);
	draw_text_transformed(_goldCostX + xAdder, _goldCostY, "N/A", 0.5, 0.5, 0);	
}
draw_set_alpha(1);