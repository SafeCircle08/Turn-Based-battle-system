//SE NON CI SONO PIU' PROIETTILI,
//RALLENTO IL TAMBURO E MI FERMO

if (keyboard_check_pressed(ord("R"))) { game_restart(); }

if (instance_number(oShell) == 0)
{
	if (angleAdder > 0) { angleAdder = angleAdder - 0.02; }
	image_angle += angleAdder;
	animating = false;
	image_speed = 0;
	image_index = 0;
	exit;
}

//VADO AD AUMENTARE DI UNO IL NUMERO DI GIRI DEL TAMBURO-------
if (image_angle % 90 == 0) && (rotDelay == 0)
{ 
	onPressEnter(14);
	if (delay == 9)
	{
		audio_play_sound(sndDrumPadSet, 50, false);
		if (angleRound + 1 < 4)
		{
			angleRound += 1; 
		} else { angleRound = 0; }
	}
	if (delay > 0) { delay--; }
	if (delay = 0) { rotDelay = 90 / angleSpeed[angleRound]; }
}

//DELAY TRA UNA ROTAZIONE E L'ALTRA----------
if (rotDelay > 0)
{
	delay = 9;
	image_angle += angleSpeed[angleRound];
	rotDelay--;
}

//QUANDO IL TAMBURO STA RUOTANDO-------------
if (animating == true)
{
	image_speed = 1;
	animationTimer--;
	if (animationTimer < 0)
	{
		image_index = 0;
		image_speed = 0;
		animating = false;
		animationTimer = 50;
	}
}

//GESTIONE DELLE BARRE DEL TEMPO
if (attackTime > 0)
{
	attackTime--;
	leftBarW -= lAdder;
	rightBarW -= rAdder;
}

//SE IL MIRINO E' VICINO ALLA CAMERA CON I PROIETTILI----------
if (keyboard_check_pressed(vk_enter) && !oDrumPadScope.canShoot)
{ audio_play_sound(sndEmpyChamber, 50, false); exit; }

if (!oDrumPadScope.canShoot) { exit; }
onPressEnter();
