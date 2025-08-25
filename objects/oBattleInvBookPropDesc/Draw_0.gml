var _propBgSpr = sPropertyBG;
var _propDescStartW = sprite_get_width(_propBgSpr);
var _propDescStartH = sprite_get_height(_propBgSpr);
var _propDescW = _propDescStartW + 30;
var _propDescH = _propDescStartH + 13;
var _propDescBgX = oBattleInvBookManager.bookX - _propDescW;
var _propDescBgY = -_propDescH;
var _borderX = 8;
var _borderY = 6;
var _detSprW = sprite_get_width(sHealPropertyDetailed);

draw_set_alpha(drawAlpha);

draw_set_font(fGenericText);
draw_sprite_stretched(_propBgSpr, 0, _propDescBgX, descBgY + _propDescBgY, _propDescW * 2, _propDescH);
draw_text_ext_transformed(_propDescBgX + _borderX, descBgY + _propDescBgY + _borderY, description, 20, _propDescW + 30, 0.5, 0.5, 0);
draw_sprite(detSprite, 0, _propDescBgX + _propDescW - _detSprW - _borderX / 2, descBgY + _propDescBgY + _borderY);
draw_set_alpha(1);