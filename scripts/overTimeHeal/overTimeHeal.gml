function overTimeHeal() {
	var _hp = global.playerHP;
	var _lowHPs = 100;
	var _middleHPs = 250;
	var _highHPs = 400;
	var _amount;
	
	if (playerOnLowHPs()) { _amount = irandom_range(5, 15); }
	if (playerOnMiddleHPs()) { _amount = irandom_range(15, 70); }
	if (playerOnHighHPs()) { _amount = irandom_range(70, 120); }
	if (playerOnGreaterThanHighHPs()) { _amount = irandom_range(120, 180); }
	
	var _myOverTimeHealSource = instance_create_layer(x, y, LAYER_EXTRAS_OBJECTS, oOverTimeHealingManager);
	_myOverTimeHealSource.amount = _amount;
	_myOverTimeHealSource.hpGoal = global.playerHP + _amount;
	return;
}