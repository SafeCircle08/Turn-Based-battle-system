bulletNum = 0;
generatorCreated = false;
//beamHeight = 300;
//indexMax = 0;

global.debugKey = keyboard_check_pressed(ord("R"));

createGenerator = function()
{
	if (generatorCreated == false)
	{
		var _actualGenerator = global.inUseGenerator[oBattleManager.turnNumber];
		instance_create_layer(x, y, "BattleBoxBgs", _actualGenerator);
		generatorCreated = true;
	}		
}

/* DA TENERE IN MENTE:
AL POSTO DI FARE UN GENERATOR DI BULLETS SI PUO' FARE UN GENERATOR DI GENERATOR DI BULLET.
CON IL CICLO FOR CHE NE CREA UNO. DENTRO QUEL GENERATOR METTI IL CODICE CON VARI TIMER PER CREARE
I DIVERSI BULLETS. IN OGNUNO METTI LE SUE INFORMAZIONI.