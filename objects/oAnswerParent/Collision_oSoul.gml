if (global.actualAnswer == global.rightAnswer)
{
	oAnswersBulletGen.answered = true;
	global.enemyTimer = global.enemyAttackTime - 100;
	instance_create_layer(self.x, self.y, "UnderEffects", oRightCheck)
	if (instance_exists(oAnswerParent)) { instance_destroy(oAnswerParent); instance_destroy(oWrongCheck); }
}
else
{
	hitPlayer(irandom_range(40, 60));
	global.enemyTimer = global.enemyAttackTime - 100;
	instance_create_layer(self.x, self.y, "UnderEffects", oWrongCheck);
	if (instance_exists(oAnswerParent)) { instance_destroy(oAnswerParent); }
}