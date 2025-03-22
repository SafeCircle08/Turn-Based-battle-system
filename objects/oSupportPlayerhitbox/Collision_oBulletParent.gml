if (oBattleBox.visible == false) { exit; }

randomize();

if (canCollide == true)
{	
	global.attackRandom = global.bulletATK + irandom_range(10, 20);
	canCollide = false;
	oBattleManager.screenShake = true;
	
	if (global.playerShield < 1) { audio_play_sound(sndHurt, 50, false); }
	//CREATING THE DAMAGE "POP" EFFECT
	instance_create_layer(x, y, "Effect", oFloatingText);
	
	if (global.playerShield > 1) { shield_shards(); }
	
	//SE E' DIFESO SUBIRA MENO DANNI
	if oBattleManager.defended == true
	{
		global.defenceValue = irandom_range(10, 15); //Defence value casuale		
		if (global.playerShield > 0) 
		{ 
			global.playerShield -= global.attackRandom; oFloatingText.damageIndex = 1;
		}
		else { global.playerHP -= global.attackRandom - global.defenceValue; oFloatingText.damageIndex = 0; };	
	} 
	else
	{
		global.defenceValue = 0;
		if (godMode = 0) 
		{	
			if (global.playerShield > 0) { global.playerShield -= global.attackRandom; oFloatingText.damageIndex = 1;}
			else { global.playerHP -= global.attackRandom; oFloatingText.damageIndex = 0;}
		}
	}
	godMode = 50;
}