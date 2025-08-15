//ONLY FOR DEBUGGING---------(skippa il turno)------------
if keyboard_check_pressed(ord("R")) 
{ 
	finishTurn(); 
	global.playerShield = global.playerMaxShield;
}