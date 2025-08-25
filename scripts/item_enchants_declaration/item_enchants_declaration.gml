#macro ENCHANT_SPRITE 0
#macro ENCHANT_FUNCTION 1

function itemEnchantsDeclaration()
{
	#macro ENCHANT_GOLDY [sGoldyEnchProperty, goldifier]
	#macro ENCHANT_OVER_TIME_HEAL [sOverTimehealEnchProperty, overTimeHeal]
}

global.enchantsInGame = [
	ENCHANT_GOLDY,
	ENCHANT_OVER_TIME_HEAL
];