//When you choose an action in the submenu
function selectAction(main = true, _moreStepsAct = true, _flavourText = [], _method = function() {})
{
	playSound(sndSelecting, SOUND_CHANNEL_1);
	if (main)
	{
		_method();
		moreStepsAct = _moreStepsAct;
		if (moreStepsAct) { showingSubWindow = true; }
		var _pages = array_length(_flavourText);
		ds_messages = ds_list_create();
		if ((_pages >= 0) && (_moreStepsAct == false))
		{
			for (var i = 0; i < _pages; i++)
			{
				ds_messages[| i] = _flavourText[i];	
			}
		}
	}
	else
	{
		_method();
		actionChoosen = true; 
		playingGuiAnimation = false;
		showingSubWindow = false;
		battleDelay = 3;
		moreStepsAct = false;			
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
	decidingSubAction = false;
	moreStepsAct = false;
	actualDrawAlpha = 0;
	battleDelay = 3;
	
	oAttackBG.fadingOut = true;
	takenOptionDelay = 3;
	
	_resetMethod();
	
	resetTextVars();
	easeOutBg();
	hideMirrors();
}

function terminateAction(_ds_list = [], _method = function() {})
{
	showBattleText = true;
	enemyTextShowed = false;
	decidingSubAction = false;
	actionChoosen = false;
	oAttackBG.fadingOut = true;
	takenOptionDelay = 3;
	battleDelay = 3;
	_method();
	
	hideMirrors();
	resetTextVars();
	
	if (array_length(_ds_list) != 0)
	{
		ds_messages = ds_list_create();
		for (var i = 0; i < array_length(_ds_list); i++) { ds_messages[| i] = _ds_list[i];	}
	}
}