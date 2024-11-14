if (oBattleBox.visible == false) { exit; }

x = oSoul.x
y = oSoul.y

//SUBITO DOPO CHE SEI COLPITO LA GODMODE E' MAGGIORE DI 0
if (godMode > 0) 
{
	godMode--;
	image_speed = 1;
}
else 
{
	//QUANDO NON SEI STATO COLPITO
	canCollide = true;
	image_speed = 0;
	image_index = 0;
}