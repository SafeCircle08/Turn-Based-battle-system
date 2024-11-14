randomize();

xShaking = irandom_range(-1, 1);
yShaking = irandom_range(-1, 1);

x += xShaking - 0.8;
y += yShaking - 0.8;

x = clamp(x, xstart - 0.3, xstart + 0.3);
y = clamp(y, ystart - 0.3, ystart + 0.3);

if (global.enemyTimer == global.enemyAttackTime - 60) { instance_destroy(self); } 