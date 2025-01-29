event_inherited();

global.createTimer = 0;
global.created = false;
global.bulletsCreated = 0;
global.enemyAttackTime = 999;

//DIMENSIONI DEL BOX
global.borderWidth = 175;
global.borderHeight = 60;

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
