//When you choose an action in the submenu

function selectAction(main = true, _moreStepsAct = true, _flavourText = [], _method = function() {})
{
	audio_play_sound(sndSelecting, 50, false, global.soundGain);
	if (main)
	{
		_method();
		moreStepsAct = _moreStepsAct;
		var _pages = array_length(_flavourText);
		if ((_pages >= 0) && (_moreStepsAct == false))
		{
			for (var i = 0; i < _pages; i++)
			{
				ds_messages[| 0] = _flavourText[i];	
			}
		}
	}
	else
	{
		_method();
		battleDelay = 3;
		moreStepsAct = false;
		choosingBattle = false;
	}	
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
	choosingBattle = false;
	
	oAttackBG.fadingOut = true;
	invPos = 0;
	itemOption = false;
	invGUI.visible = false;
	takenOptionDelay = 3;
	itemCordTaken = false;
	itemOptionNav = [];
	
	_resetMethod();
	
	easeOutBg();
	resetTextVars();
	hideMirrors();
}

//When you terminate an action (when the attack section finishes for example)
function terminateAction(_ds_list = [], _method = function() {})
{
	enemyTextShowed = false;
	takenOptionDelay = 3;
	battleDelay = 3;
	acting = false;
	showBattleText = true;
	choosingBattle = false;
	oAttackBG.fadingOut = true;
	attacking = false;
	unbinding = false;
	using_special_action = false;
	itemOption = false;
	invGUI.visible = false;
	drawNav = true;
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