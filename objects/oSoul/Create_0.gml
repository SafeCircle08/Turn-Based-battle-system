key_right = keyboard_check(ord("D")) 
key_left = keyboard_check(ord("A")) 
key_up = keyboard_check(ord("W")) 
key_down = keyboard_check(ord("S")) 
key_jump = keyboard_check_pressed(vk_space);
key_jumpPressed = keyboard_check(vk_space);

basicPlayerVars();
beamTimerVars();
shaderVars();

stateFreeLoad();
stateMirroredLoad();
stateUmbrellaLoad();
stateUsingUmbrella();
stateGravityLoad();
stateSpiderLoad();
stateCartingLoad();

state = stateFree;

loadPlayerStateInfo();