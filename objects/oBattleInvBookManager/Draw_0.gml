var bookBgX = bookX;
var bookBgY = bookY;

var bookBgSpr = sInventoryBG;

draw_set_alpha(drawAlpha);

draw_sprite_stretched(bookBgSpr, 0, bookX, bookBgY, bookBgW, bookBgH);
var _yAdder = 0;

var hoovering = false;

//Draws the text
for (var i = 0; i < array_length(global.propertiesKind); i++)
{
	var _miniPropBorder = 7;
	var _miniPropW = sprite_get_width(sHealProperty);
	var _miniPropH = sprite_get_height(sHealProperty);
	var _propTextX = bookX + (bookBgW / 2);
	var _propTextY = bookY + 10;
	
	var _propsPerRow = 5;
	var _rowsOfProps = ceil((array_length(global.propertiesKind[i]) - 1) / _propsPerRow);
	var z = 1;
	
	var _propText = global.propertiesKind[i][PROPERTY_TEXT_SPRITE];
	draw_sprite(_propText, 0, _propTextX, _propTextY + _yAdder);
	
	//Draws the actual mini props 
	for (var j = 0; j < _rowsOfProps; j++)
	{
		var _miniPropX = bookX + _miniPropBorder;
		var _miniPropY = _propTextY + _miniPropBorder * 2 + (_miniPropH * j + 1 * j) + _yAdder;
		z = 1;
		
		for (var k = 1 + 5 * j; k < 6 + 5 * j; k++)
		{
			if (_miniPropY > 0 && _miniPropY < 210)
			{
				draw_sprite(global.propertiesKind[i][k].sprite, 0, _miniPropX + (_miniPropW * (z - 1) + 1 * (z - 1)), _miniPropY);	
			}
			if (
			    mouse_x > _miniPropX + (_miniPropW * (z - 1) + 1 * (z - 1)) &&
			    mouse_x < _miniPropX + (_miniPropW * (z - 1) + 1 * (z - 1)) + 10 &&
			    mouse_y > _miniPropY &&
			    mouse_y < _miniPropY + 10
			)
			{
				hoovering = true;
				if (!instance_exists(oBattleInvBookPropDesc)) {
					var _propDescObj = instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oBattleInvBookPropDesc);
					_propDescObj.description = global.propertiesKind[i][k].desc;
					_propDescObj.detSprite = global.propertiesKind[i][k].detailedSprite;
				}	
			}
			z += 1;
			if (k >= array_length(global.propertiesKind[i]) - 1) { break; }
		}
	}
	_yAdder += 11 + 5 + (_rowsOfProps * 10 + 5);
}

if (hoovering == false) && (instance_exists(oBattleInvBookPropDesc)) { instance_destroy(oBattleInvBookPropDesc); }
draw_set_alpha(1);