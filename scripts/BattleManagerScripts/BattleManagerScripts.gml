//When you choose an action in the submenu
function chooseAction(_method = function() {})
{
	_method();
	battleDelay = 3;
	choosingBattle = false;
}

//Reset the text variables to show all the texts
function resetTextVars()
{
	charCount = 0;
	page = 0;
	btTextWrote = 0;
}

//Self explanatory lol
function showMirrors() { instance_activate_object(oMirror); }
function hideMirrors() { instance_deactivate_object(oMirror); }

function easeInBg(_maxAlpha = 0.7, _bgObj = oAttackBG) 
{
	increaseAlpha(
		_bgObj, 
		0.07, 
		_maxAlpha,
		method(_bgObj, function() {
			fadingIn = false;	
		})
	);
}
function easeOutBg(_finalAlpha = 0, _bgObj = oAttackBG)
{
	reduceAlpha(
		_bgObj,
		0.07,
		false,
		method(_bgObj, function(){
			fadingOut = false;
		})
	);
}

//When you are in the sub menu and you press "X"
function resetNavigation(_lastOption = 0, _resetMethod = function() {})
{
	audio_play_sound(sndSelecting, 50, false, global.soundGain);
	actualDrawAlpha = 0;
	selected_option = _lastOption;
	acting = false;
	moreStepsAct = false;
	actualDrawAlpha = 0;
	battleDelay = 3;
	turnNumber -= 1;
	_resetMethod();
	easeOutBg();
	resetTextVars();
	hideMirrors();
}

//When you terminate an action (when the attack section finishes for example)
function terminateAction(_action, _ds_list = [], _method = function() {})
{
	_action[0] = false; //fixare _action[0] = false
	enemyTextShowed = false;
	takenOptionDelay = 3;
	battleDelay = 3;
	acting = false;
	showBattleText = true;
	choosingBattle = false;
	oAttackBG.fadingOut = true;
	
	_method();
	
	hideMirrors();
	resetTextVars();
	
	if (array_length(_ds_list) != 0)
	{
		//Creates the proper ds_list, if needed
		if (!ds_exists(ds_messages, ds_type_list)) { ds_messages = ds_list_create(); }
	
		//Assign the ds messages value
		for (var i = 0; i < array_length(_ds_list); i++)
		{
			ds_messages[| i] = _ds_list[i];	
		}
	}
}