#macro PROPERTY_INFO_SPRITE 0
#macro PROPERTY_INFO_DESC 1
#macro PROPERTY_TEXT_SPRITE 0

itemPropertiesDeclaration();

function setUpPropertyInfos(property, propertyDesc, detSprite = sHealPropertyDetailed, _enchanted = false) {
	return {
		sprite: property,
		desc: propertyDesc,
		detailedSprite: detSprite,
		enchanted: _enchanted
	}
}

global.propertiesOfHealing = [
	sHealingPropertyText,
	setUpPropertyInfos(ITEM_PROPERTY_HEAL, "Simply recovers HPs!", sHealPropertyDetailed),
	setUpPropertyInfos(ITEM_PROPERTY_DOUBLE_HEAL, "Recovers twice the HPs that an item grants!", sDoubleHealPropertyDetailed),
	setUpPropertyInfos(ITEM_PROPERTY_OVER_TIME_HEAL, "Recovers HPs Over Time.", sOverTimeHealDetailed),
];

global.propertiesOfBoosts = [
	sBoostsPropertyText,
	setUpPropertyInfos(ITEM_PROPERTY_DEF, "Defence property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_ADD_TO_INV, "add inv property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_JUMP_BOOST, "jump property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_STRENGTH, "stren property lol", sStrengthPropertyDetailed),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
];

global.propertyOfPains = [
	sPainsPropertyText,
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "Consuming will cause endless pain.", sBioHaazardPropertyDetailed),
];

global.propertyOfEnchantments = [
	sMagickPropertyText,
	setUpPropertyInfos(ENCHANT_GOLDY[ENCHANT_SPRITE], "Returns [GOLD] after consuming!", sGoldyEnchDetailed, true),
	setUpPropertyInfos(ENCHANT_OVER_TIME_HEAL[ENCHANT_SPRITE], "Will recover additional HPs over time.", sOverTimeHealEnchDet, true)
];

global.propertiesKind = [
	global.propertiesOfHealing,
	global.propertiesOfBoosts,
	global.propertyOfPains,
	global.propertyOfEnchantments
];