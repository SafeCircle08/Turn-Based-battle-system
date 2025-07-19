/// @description Insert description here
// You can write your code in this editor
// feather disable all

global.enemySeq = layer_sequence_create("Enemy", 101, 41, Sequence1);
a_text = [];

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
acting = false;
selected_option = 0;

shieldBarW = 121;
hpbarW = 121;

//ATTACK FUNCTION VARIABLES
attacking = false;

//BOX VARIABLES and TEXTS
boxWidth = sprite_get_width(sTextBG) + 10;
strHeight = string_height(global.textList[turnNumber]);
charCount = 0;
enter = keyboard_check_pressed(vk_enter);
page = 0;
speechSpeed = 0.5;
ds_messages = ds_list_create();
messageCounter = 0;
showBattleText = false;
messageTimer = 0;
timeBeforePressed = 15;
enemyTextShowed = false;
enemyCanShowText = 0;
textSkipTimer = 100;
color = c_white;
dialogueDelay = 10;
lastSpace = 0;

//BUTTONS VARIABLES
startButtonXRef = -200;
startButtonX = startButtonXRef;
buttonFrame = 0;
btTextWrote = false;
btCharCount = 0;

//INVENTORY VARIABLES
frame = -1;
invGUI = undefined;
itemOptionNav = []; //the position to navigate in the inventory
takenOptionDelay = 3;
itemOutput = undefined;
maxOption = undefined;
itemCordTaken = false;
drawNav = true;
itemOption = false; //if you decided to use the item act
invPos = 0; //the pos your cursor is in the inventory

//BATTLE OPTIONS VARIABLES
battlePos = 0;
battleOpNav = [];
choosingBattle = false;
battleDelay = 3;
actualDrawAlpha = 0;
defending = false;

unbinding = false;
healing = false;
using_special_action = false;

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