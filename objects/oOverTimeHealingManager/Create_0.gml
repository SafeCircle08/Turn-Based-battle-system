amount = 0;
hpTimer = 0;
hpGoal = 0;

hasHealed = function() {
	return (global.playerHP == hpGoal);
}

terminateOverTimeHealing = function(){ 
	instance_destroy(self); 
}

healOverTime = function(){
	hpTimer++;
	if (!hasHealed()) {
		if (hpTimer >= 60) {
			global.playerHP += 1;
			hpTimer = 0;
		}
	} else {
		terminateOverTimeHealing();	
	}
}