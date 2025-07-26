function openSettings()
{
	
}

global.windowButtons = {
	
	closeGame: {
		btnSprite: sQuitButton,
		text: "Quit",		
		key: ord("Q"),
		keyText: "(Q)",
		_function: function() { game_end(); }
	},
	fullScreenToggle: {
		btnSprite: sFullScreenButton,
		text: "FullScreen Mode",
		key: vk_f4,
		keyText: "(F4)",
		_function: function() {
			window_set_cursor(cr_none);
			window_set_fullscreen(true);
		}	
	},
	windowedScreenToggle: {
		btnSprite: sWindowedScreenButton,
		text: "Windowed Mode",
		key: vk_f5,
		keyText: "(F5)",
		_function: function() {
			window_set_cursor(cr_default);
			window_set_fullscreen(false);		
		}	
	},
	openSettingsTab: {
		btnSprite: sSettingsButton,
		text: "Settings",
		key: vk_f6,
		_function: function() {
			openSettings() //to implement
		}
	}
}

global.windowButtonSettings = 
[
	global.windowButtons.closeGame,
	global.windowButtons.fullScreenToggle,
	global.windowButtons.windowedScreenToggle
]


function createWindowSettingsButtons()
{
	var _l = array_length(global.windowButtonSettings);
	var _x = camera_get_view_width(view_camera[view_current]) - 20; 
	var _y = 50;
	var _sprH = sprite_get_height(sQuitButton);
	for (var i = 0; i < _l; i++)
	{
		var _btn = instance_create_layer(_x, _y + (_sprH * i + (2 * i)), "Text", oWindowSettingButton);
		_btn.sprite_index = global.windowButtonSettings[i].btnSprite;
		_btn.attachedY = 16 * i + (2 * i);
		_btn.textKey = global.windowButtonSettings[i].keyText;
		_btn.performFunction = global.windowButtonSettings[i]._function;
		_btn.secondKey = global.windowButtonSettings[i].key;
		_btn.text = global.windowButtonSettings[i].text;
	}
}