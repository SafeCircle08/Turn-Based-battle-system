event_inherited();
image_xscale = 0.5;
image_yscale = 0.5;
targetX = xstart + sign(xstart) * (-365);
targetY = ystart + sign(ystart) * (-365);
reached = false;
gettingPower = 0;

image_speed = 0;
image_angle = point_direction(x, y, oSoul.x, oSoul.y)
firstImageAngle = image_angle;

rotations = 15;
finalDegree = 360 * rotations;
timer = 70;
actualTimer = 70;
goBackTimer = 20;
actualGoBackTimer = 0;
beamPoint = undefined;
audio_play_sound(blaster_reloading, 50, false, global.soundGain);