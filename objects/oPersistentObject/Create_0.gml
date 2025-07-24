#macro FPS 60


target_delta = 1 / FPS;

global.actualDelta = delta_time / 1_000_000;
global.deltaMult = global.actualDelta / target_delta;