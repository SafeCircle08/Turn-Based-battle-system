randomize();

if (createBlaster == true)
{	
	if (specific == false)
	{
		for (var i = 0; i < blasterNum; i++)
		{
			var _maxIndex_X = array_length(possibleXPos) - 1;
			var _maxIndex_Y = array_length(possibleYPos) - 1;
			var index_x = irandom_range(0, _maxIndex_X);
			var index_y = irandom_range(0, _maxIndex_Y);
		
			if (oBattleManager.turnNumber == 20) { index_y = oRectangleIndicator.index; }
			
			lineCannon = instance_create_layer(possibleXPos[index_x], possibleYPos[index_y], "Instances", oCannonLine);
			lineCannon.targetX = targetX[index_x];
			lineCannon.targetY = targetY[index_y];
			lineCannon.face = faceDirection;
			lineCannon.actualTimer = blasterTimer;
		}
	}
	else
	{
		for (var i = 0; i < blasterNum[numIndex]; i++)
		{
			lineCannon = instance_create_layer(possibleXPos[indexX], possibleYPos[indexY], LAYER_BULLETS, oCannonLine);	
			lineCannon.targetX = targetX[indexX];
			lineCannon.targetY = targetY[indexY];
			lineCannon.face = faceDirection;
			lineCannon.actualTimer = blasterTimer;
			indexX += 1;
			indexY += 1;
			if (indexX == array_length(targetX) - 1) { instance_destroy(self); }
		}
	}
	numIndex += 1;
	createBlaster = false
}