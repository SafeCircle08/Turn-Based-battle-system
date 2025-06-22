//FUNZIONE POSIZIONATA ALL'INIZIO DI OGNI
//STATE NEL oSoul create Event.
//QUANDE IL PLAYER CHIAMA LA FUNZIONE "move"
//DALLO STETE, QUESTA VIENE CHIAMATA E METTE
//IL GIUSTO SPRITE AL PLAYER E DOPO CREA L'EFFETTO

function stateInit(_sIndex, _sprEffect, _pov, secondAction = false, _method = function() {})
{
	if (global.playerMoveTimer == 20)
	{
		sprite_index = _sIndex;
		global.pov = _pov;
	}
	if (global.playerMoveTimer == 5)
	{
		effect = instance_create_layer(oSoul.x, oSoul.y, "ExtrasObjects", oPlayerEffect);
		effect.sprite_index = _sprEffect;
		if (instance_exists(oBoxSidePlatformParent)) { instance_destroy(oBoxSidePlatformParent); }
		if (secondAction == true) { _method(); }
		return;
	}
}