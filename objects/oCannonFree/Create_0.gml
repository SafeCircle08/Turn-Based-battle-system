//Trovare un modo per far si che i generator che creano,
//i blaster si distinguano in base alla loro "capacità di movimento".
//Se si muovono solo in riga oppure se si possono muovere liberamente.

event_inherited();

image_xscale = 0.5;
image_yscale = 0.5;

targetX = xstart + sign(xstart) * (-350);
targetY = ystart + sign(ystart) * (-350);
reached = false;

image_speed = 0;

image_angle = point_direction(x, y, oSoul.x, oSoul.y)
firstImageAngle = image_angle;

distance = abs(point_distance(xstart, ystart, targetX, targetY));

rotations = 15;
finalDegree = 360 * rotations;

timer = 70;
goBackTimer = 20;

beamPoint = undefined;

audio_play_sound(blaster_reloading, 50, false);
