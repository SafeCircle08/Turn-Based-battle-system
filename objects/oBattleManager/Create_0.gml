/// @description Insert description here
// You can write your code in this editor
// feather disable all

a_text[0] = "ATK";
a_text[1] = "DEF";
a_text[2] = "FREE";
a_text[3] = "ITEM";

//BATTLE BOX VARIABLES
global.borderWidth = 100;
global.borderHeight = 100;

//PLAYER VARIABLES
battle = true;
turnNumber = 14;
global.playerName = "Misery";
global.playerMAX_HP = 200;
global.playerHP = 200;
global.playerShield = 50;
global.playerMaxShield = 50;
global.CSvalue = 100;	//CAGE STATE
global.CSvalueMax = 100;
global.playerAttackTimer = 300;
global.playerAttackTime = 0;
global.barHit = undefined;
barCreated = false;
attackPressed = false;
defended = false;
playerDeath = false;
playerTurn = true;
attacking = false;
attackBGalpha = 0;
barCreated = false;
canDrawAttackGui = false;

//BOX VARIABLES and TEXTS
boxWidth = sprite_get_width(sTextBG) + 10;
stringHeight = string_height(global.textList[turnNumber]);
charCount = 0;
page = 0;
speechSpeed = 0.5;

//---------BARS VARIABLES----------
//HEALTH BAR
healthbar_width = 121;
healthbar_height = 16;
healthbarX = surface_get_width(application_surface) / 2;
healthbarY = surface_get_height(application_surface);

//SHIELD BAR
shieldbar_width = 121;
shieldbar_height = 16;
shieldBarX = surface_get_width(application_surface) / 2;
shieldBarY = surface_get_height(application_surface);

//CS BAR
csbar_width = 121;
csbar_height = 10;

//--------------ENEMY VARIABLES---------------
global.monsterHP = 500;
global.maxMonsterHp = 500;
global.monsterDamage = 1;
global.enemyTimer = 0;

selected_option = 0;
ds_messages = ds_list_create();
messageCounter = 0;
showBattleText = false;

messageTimer = 0;
timeBeforePressed = 15;

battleOption = 0;
roll = 0;

//SCREEN SHAKE
screenShake = false;
maxShakeX = 3;
maxShakeY = -3;
shakeX = 0;
shakeY = 0;
shakeTimer = 0;
timerTillShakeEnds = 30;

//TEXT VARIABLES
page = 0;
enemyTextShowed = false;
enemyCanShowText = 0;
textSkipTimer = 50;
color = c_white;