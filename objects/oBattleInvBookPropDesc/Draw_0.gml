var _propBgSpr = sPropertyBG;
var _propDescStartW = sprite_get_width(_propBgSpr);
var _propDescStartH = sprite_get_height(_propBgSpr);
var _propDescW = _propDescStartW + 30;
var _propDescH = _propDescStartH + 13;
var _propDescBgX = oBattleInvBookManager.bookX - _propDescW;
var _propDescBgY = -_propDescH;
var _borderX = 4;
var _borderY = 2;

draw_set_alpha(drawAlpha);

draw_set_font(fGenericText);
draw_sprite_stretched(_propBgSpr, 0, _propDescBgX, descBgY + _propDescBgY, _propDescW * 2, _propDescH);
draw_text_ext_transformed(_propDescBgX + _borderX, descBgY + _propDescBgY + _borderY, description, 20, _propDescW + 30, 0.5, 0.5, 0);
draw_sprite(detSprite, 0, _propDescBgX + _propDescW - _borderX - 32, descBgY + _propDescBgY + _borderY + 4);

draw_set_alpha(1);