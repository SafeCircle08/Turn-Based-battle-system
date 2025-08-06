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
takenOptionDelay = 3;
itemOutputMessage = undefined;

//BATTLE OPTIONS VARIABLES
battleDelay = 3;
actualDrawAlpha = 0;

initializeInventoryAnimations();
initializeSubBattleMenuAnimations();

subMenuX = 0;
subMenuY = 0;
mainPressed = 0;

playingGuiAnimation = false;

//Method
setSubMenuPositions = function(_x, _y)
{
	subMenuX = _x;
	subMenuY = _y;
}
showingSubSubWindow = false;

actionChoosen = false;
showingSubWindow = false;
subSubDelay = 3;

//The effect
makeAlphaSinEffect(15, 0, LAYER_UNDER_EFFECT, 5, sInventory, 3, false, 2, 1.8, true);
//Initialize the "coded" functions
initializeAllCreatedFunctions();

//Initialize the functions the player havs
initializePlayerOptionsinfo();
initializePlayerMainBattleMenuOptions();