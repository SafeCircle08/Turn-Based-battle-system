event_inherited();

genTimeVars(0, false, 999, 0);
boxDimensions(175, 60);
playerChangeState(oSoul.stateFree);
setBoxOrigin(room_width / 2, room_height / 2);

answered = false;
timer = 999;
steamTimer = 80;
steamAttackindex = 0;

global.rightAnswer = noone;
global.actualAnswer = noone;
global.answers = ["C", "A", "D"];

global.questions = 
[
	"How much is 6x6?",
	"How much is 7x9?",
	"How much is 8x9?",
];

global.possibleAnswers = 
[
	"A: 6;  B: 1;  C: 36;  D: IDK",
	"A: 63;  B: 16;  C: -2;  D: IDK",
	"A: 17; B: -1; C: 75; D: 72",
];
