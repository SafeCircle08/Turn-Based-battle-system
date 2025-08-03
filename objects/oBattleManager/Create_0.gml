/// @description Insert description here
// You can write your code in this editor
// feather disable all

//global.enemySeq = layer_sequence_create("Enemy", 101, 41, Sequence1);
mainOptionsNames = [];

//BATTLE BOX VARIABLES
global.borderWidth = 100;
global.borderHeight = 100;

//PLAYER VARIABLES
battle = true;
turnNumber = 0;
defended = false;
playerDeath = false;
playerTurn = true;

//GENERAL ACT VARIABLES
moreStepsAct = false; //if an action requires more steps
decidingSubAction = false;
selected_option = 0;

shieldBarW = 121;
hpbarW = 121;

//ATTACK FUNCTION VARIABLES
attacking = false;

//BOX VARIABLES and TEXTS
charCount = 0;
page = 0;
speechSpeed = 0.5;
ds_messages = ds_list_create();
messageCounter = 0;
showBattleText = false;
messageTimer = 0;
timeBeforePressed = 15;
enemyTextShowed = false;
enemyCanShowText = 0;
dialogueDelay = 10;

//BUTTONS VARIABLES
startButtonXRef = -200;
startButtonX = startButtonXRef;
buttonFrame = 0;
btTextWrote = false;

//INVENTORY VARIABLES
frame = -1;
invItemNamesGUI = undefined;
navigatingInventoryNav = []; //the position to navigate in the inventory
takenOptionDelay = 3;
itemOutputMessage = undefined;
itemCordTaken = false;
navigatingInventory = false; //if you decided to use the item act
invPos = 0; //the pos your cursor is in the inventory

//BATTLE OPTIONS VARIABLES
navigatingSubMenu = false;
battleDelay = 3;
actualDrawAlpha = 0;

//Alpha Values
subMenuAlpha = 0;
subMenuXAdder = 0;

subArrowGoalX = 20;
subArrowAlpha = 0;
subMenuSwiping = false;

subMenuFadeIn = function()
{
	subMenuXAdder += 7;
	subMenuAlpha += 0.05;
	subMenuXAdder = clamp(subMenuXAdder, 0, 58);
	subMenuAlpha = clamp(subMenuAlpha, 0, 1);	
}

subMenuFadeOut = function()
{
	if (subMenuAlpha > 0) { subMenuAlpha -= 0.05; }
	if (subMenuXAdder > 0) { subMenuXAdder -= 5; }
	subMenuXAdder = clamp(subMenuXAdder, 0, 58);
	subMenuAlpha = clamp(subMenuAlpha, 0, 1);			
}

subMenuX = 0;
subMenuY = 0;
//Method
setSubMenuPositions = function(_x, _y)
{
	subMenuX = _x;
	subMenuY = _y;
}

actionChoosen = false;

//The effect
makeAlphaSinEffect(15, 0, LAYER_UNDER_EFFECT, 5, sInventory, 3, false, 2, 1.8, true);

//------------------------------MENU NAVIGATION SECTION & ACTIONS------------------------------\\

//MAIN MENU FUNCTIONS
//Default ones
initializeNavigatingBattleOptionFunctions();
initializeDefend_old_OptionFunction();
initialiseCryOptionFunction();
initializeInventoryOptionFunctions();
//Special ones
initializeHealCheatFunction();

//SUBMENU FUNCTIONS
//Default ones
initializeAttackFunctions();
initializeUnbindFunctions();

//Special ones
initializeDefenceFunctions();

//Initialize all the option the player has equipped
initializePlayerOptionsinfo();
initializePlayerMainBattleMenuOptions();