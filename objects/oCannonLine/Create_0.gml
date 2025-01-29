//Trovare un modo per far si che i generator che creano,
//i blaster si distinguano in base alla loro "capacità di movimento".
//Se si muovono solo in riga oppure se si possono muovere liberamente.

targetX = xstart + (sign(xstart) * -260);
//targetY = ystart + (sign(ystart) * -300);
reached = false;

image_speed = 0;

image_angle = point_direction(x, y, x + 100, y)
firstImageAngle = image_angle;
rotations = 7;
finalDegree = 360 * rotations; //(720)

timer = 20;
goBackTimer = 90;

beamPoint = undefined;

audio_play_sound(blaster_reloading, 50, false);