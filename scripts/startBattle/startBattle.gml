function startBattle(_enemyInfo = function() {})
{
	room_goto(Room_Battle);
	_enemyInfo();
	view_visible[0] = false;
	view_visible[1] = true;
}