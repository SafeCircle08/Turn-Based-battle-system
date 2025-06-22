//This function takes all the variables from the drumPad parent object
//and overwrites them to have new values.
//In that way, we can create a lot of different kinds of drumPads!

//angleAdder: how much image_angle is increased per step;
//delayRef: how much time will pass before the pad rotates again;
//angleSpeed: an array, wich containt the different speeds during the rotations; (90 % angleSpeed[n] == 0)
//fact: the playerAttackTimer multiplier;
//shellNumber: how much shells does the drumPad have; ex. 4, ex. 6 (this needs to change previous variables);
//maxShell number: the maximun amount of shells;
//maxBadShall: the maximun amount of bad shells the drumPad can contain;
//attackTime: the attackime :)
//lAdder and rAdder: how the different bars will be increasing as the times goes on;

function dpSetVariables(_angleAdderRef, _delayRef, _angleSpeed, _fact, _angles, _shellN, _badShellN, _maxBadShellN)
{
	global.eqDrumPad.angleAdderRef = _angleAdderRef;
	global.eqDrumPad.delayRef = _delayRef;
	global.eqDrumPad.angleSpeed = _angleSpeed;
	global.eqDrumPad.fact = _fact;
	global.eqDrumPad.angles = _angles;
	global.eqDrumPad.shellNumber = _shellN;
	global.eqDrumPad.maxShellNumber = _badShellN;
	global.eqDrumPad.maxBadShell = _maxBadShellN;
	//Set the duration of the attack base on the fact variable
	global.playerAttackTimer = rightBarW * fact;
	global.eqDrumPad.attackTime = global.playerAttackTimer - 1;
	global.eqDrumPad.lAdder = leftBarW / attackTime;
	global.eqDrumPad.rAdder = rightBarW / attackTime;
}