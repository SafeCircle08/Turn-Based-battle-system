#macro LOW_HPS 90
#macro MIDDLE_HPS 250
#macro HIGH_HPS 400

function playerOnLowHPs() {
	return global.playerHP < LOW_HPS
}

function playerOnMiddleHPs() {
	return global.playerHP >= LOW_HPS && 
		   global.playerHP < MIDDLE_HPS
}

function playerOnHighHPs() {
	return global.playerHP > MIDDLE_HPS &&
		   global.playerHP <= HIGH_HPS
}

function playerOnGreaterThanHighHPs() {
	return global.playerHP > HIGH_HPS
}