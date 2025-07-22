//SE NON CI SONO PIU' PROIETTILI,
//RALLENTO IL TAMBURO E MI FERMO
event_inherited();

if (keyboard_check_pressed(ord("R"))) { game_restart(); }

if (animating == true) { image_speed = 1; } 
else { image_speed = 0; image_index = 0; }

//Quando il turno è finito
if (instance_number(oShell) == 0) || (reduceDimensionsAlpha == true)
{
	if (angleAdder > 0) { angleAdder -= 0.02; }
	image_angle += angleAdder + 10;
	exit;
}

print(floor(image_angle))

//VADO AD AUMENTARE DI UNO IL NUMERO DI GIRI DEL TAMBURO-------
if (image_angle % 90 == 0) && (rotDelay == 0)
{ 
	dpShoot(irandom_range(10, 25));
	if (delay == delayRef - 1)
	{
		audio_play_sound(sndDrumPadSet, 50, false);
		if (angleRound + 1 < 4)
		{
			angleRound += 1; 
		} else { angleRound = 0; }
	}
	if (delay > 0) { delay -= 1; }
	if (delay == 0) { rotDelay = (90 / angleSpeed[angleRound]); }
}

//DELAY TRA UNA ROTAZIONE E L'ALTRA----------
if (rotDelay > 0)
{
	delay = delayRef - 1;
	image_angle += angleSpeed[angleRound];
	rotDelay -= 1;
}

//QUANDO IL TAMBURO E' ANIMATO-------------
if (animating == true)
{
	animationTimer -= 1;
	if (animationTimer < 0)
	{
		animating = false;
		animationTimer = 50;
	}
}

//GESTIONE DELLE BARRE DEL TEMPO
if (attackTime > 0)
{
	attackTime -= 1;
	leftBarW -= lAdder;
	rightBarW -= rAdder;
}

//SE IL MIRINO E' VICINO ALLA CAMERA CON I PROIETTILI----------
if (keyboard_check_pressed(vk_enter) && !oDrumPadScope.canShoot)
{ audio_play_sound(sndEmptyChamber, 50, false); exit; }

if (!oDrumPadScope.canShoot) { exit; }
dpShoot(0);