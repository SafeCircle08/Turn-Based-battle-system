toMoveTimer = 60;
spd = 0;
distance = 0;
shakeTimer = 50;

sprites = [sIron, sLithium, sCobalt];
index = irandom_range(0, array_length(sprites) - 1);
sprite_index = sprites[index];