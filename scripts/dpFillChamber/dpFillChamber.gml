//This function is used to actually fill the drumPad 
//once it is created with all its variables!

//_shellN: how much shells will the drumPad have;
//_maxBadShellN: max amount of bad shells (the limits of this is _shellN - 1, because on 0, the enemy cannot attack);
//_badShellN: the actual number of badShell into tha drumPad;
//_angles: when creating a shell, it is given its angle (to rotate correctly);
//_probability: if set on false, the drumPad will always have '_maxBadShellN' instances of badShells;
//_probability: if set on true, there is only a chance, each round, for a badShell to be put into the drumPad;
//_minR: the minimun range (always 0);
//_maxR: the max range :)

function dpFillChamber(_shellN, _maxBadShellN, _badShellN, _angles, _probability = false, _minR = 0, _maxR = 0)
{
	//Fill chambers with probability:
	if (_probability == true)
	{
		//Create the shells
		for (var i = 0; i < _shellN; i++)
		{
			if (_badShellN < _maxBadShellN) && (irandom_range(_minR, _maxR) == 2)
			{
				var actualShell = instance_create_layer(x, y, LAYER_SHELLS, oBadShell);	
				actualShell.adder = _angles[i];
				_badShellN += 1;
				continue;
			}
			var actualShell = instance_create_layer(x, y, LAYER_SHELLS, oShell);
			actualShell.adder = _angles[i];
		}
		return;
	}	
	
	//Fill chambers with no probability:
	for (var i = 0; i < _shellN; i++)
	{
		if (_badShellN < _maxBadShellN)
		{
			var actualShell = instance_create_layer(x, y, LAYER_SHELLS, oBadShell);	
			actualShell.adder = _angles[i];
			_badShellN += 1;
			continue;
		}
		var actualShell = instance_create_layer(x, y, LAYER_SHELLS, oShell);
		actualShell.adder = _angles[i];
	}		
	return;
}