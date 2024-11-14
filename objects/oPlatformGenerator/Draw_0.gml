if (yStart > global.boxOriginY + global.borderHeight / 2 ) { yStart -= 0.08; }
timer--

if (timer < 0)
{
	if (waveAlpha < 1 ) { waveAlpha += 0.010; }
	if(lavaDropperAlpha < 0.5) { lavaDropperAlpha += 0.0025; }  
	waveIndex += 0.05;
	if (waveIndex == image_number) { waveIndex = 0; }
	draw_sprite_ext(sLavaDroppers, waveIndex, global.boxOriginX, global.boxOriginY, 1, 1, image_angle, c_white, lavaDropperAlpha);
}

//DRAWING THE ACTUAL WAVES
for (var i = 0; i < numberOfWaves; i++)
{
	var _xx = (global.boxOriginX - (global.borderWidth / 2))
	var _width = sprite_get_width(sWave);
	draw_sprite_ext(sWave, waveIndex, _xx + (i * _width), yStart, 1, 1, image_angle, c_white, waveAlpha);
}