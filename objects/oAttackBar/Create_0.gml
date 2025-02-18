image_speed = 0;
y = oAttackRoll.y;
missed = false;
hit = false;
spd = 2;

if (oBattleManager.turnNumber % 2 == 0)
{ 
	spd = -2;
	x = room_width / 2 + 115;
}

animationTimer = 60;