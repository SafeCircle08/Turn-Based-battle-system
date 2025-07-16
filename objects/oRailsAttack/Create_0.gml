event_inherited();
rails_lines = 0;
rails_columns = 0;
width = sprite_get_width(sRails);
height = sprite_get_height(sRails);
create = 0;

maxPlayerX = room_width;
frame = 90;
spriteInput = sPlayerCarting;

pressDelayRef = 20;
pressDelay = pressDelayRef;
clickBeforeDelay = false;
inMemKey = -1;

possiblePlayerYpos = [];
actualPlayerPos = 0; //Gives the middle position
getCoordTimer = 55;
movingUp = false;
movingDown = false;
sliding = false;

slideTimerRef = 20;
slideTimer = slideTimerRef;

//Walls positions
obstaclePerWall = 0;

pressingUp = function()
{
	actualPlayerPos--;
	actualPlayerPos = clamp(actualPlayerPos, 0, rails_lines - 1);
	pressDelay = pressDelayRef;
	sliding = true;
	spriteInput = sPlayerCartingUp;		
}
pressingDown = function()
{
	actualPlayerPos++;	
	actualPlayerPos = clamp(actualPlayerPos, 0, rails_lines - 1);
	pressDelay = pressDelayRef;
	sliding = true;
	spriteInput = sPlayerCartingDown;		
}
whileSliding = function(_soulSprite)
{
	var _startY = oSoul.y;
	oSoul.sprite_index = _soulSprite;
	var _finalY = possiblePlayerYpos[actualPlayerPos];
	oSoul.y = lerp(_startY, _finalY, 0.5);
}