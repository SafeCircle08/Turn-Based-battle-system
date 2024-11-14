if (global.actualAnswer == global.rightAnswer)
{
	oAnswersBulletGen.answered = true;
	global.enemyTimer = global.enemyAttackTime - 100;
	instance_create_layer(self.x, self.y, "UnderEffects", oRightCheck)
	if (instance_exists(oAnswerParent)) { instance_destroy(oAnswerParent); instance_destroy(oWrongCheck); }
}
else
{
	global.playerHP -= 30;
	global.enemyTimer = global.enemyAttackTime - 100;
	instance_create_layer(self.x, self.y, "UnderEffects", oWrongCheck);
	instance_create_layer(100, 100, "UnderEffects", oWord);
	if (instance_exists(oAnswerParent)) { instance_destroy(oAnswerParent); }
}