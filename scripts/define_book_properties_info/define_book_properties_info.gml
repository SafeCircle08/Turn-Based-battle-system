#macro PROPERTY_INFO_SPRITE 0
#macro PROPERTY_INFO_DESC 1
#macro PROPERTY_TEXT_SPRITE 0

itemPropertiesDeclaration();

function setUpPropertyInfos(property, propertyDesc, detSprite = sHealPropertyDetailed) {
	return {
		sprite: property,
		desc: propertyDesc,
		detailedSprite: detSprite
	}
}

global.propertiesOfHealing = [
	sHealingPropertyText,
	{
		sprite: ITEM_PROPERTY_HEAL,
		desc: "Recovers HPs",
		detailedSprite: sHealPropertyDetailed
	},
	{
		sprite: ITEM_PROPERTY_DOUBLE_HEAL,
		desc: "Recovers twice the HPs the Item grants.",
		detailedSprite: sHealPropertyDetailed
	},
	{
		sprite: ITEM_PROPERTY_OVER_TIME_HEAL,
		desc: "Recovers HPs over time",		
		detailedSprite: sHealPropertyDetailed
	},
];

global.propertiesOfBoosts = [
	sBoostsPropertyText,
	setUpPropertyInfos(ITEM_PROPERTY_DEF, "Defence property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_ADD_TO_INV, "add inv property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_JUMP_BOOST, "jump property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_STRENGTH, "stren property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
	setUpPropertyInfos(ITEM_PROPERTY_WATER, "water property lol"),
];

global.propertyOfPains = [
	sPainsPropertyText,
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "pain to you lol"),
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "pain to you lol"),
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "pain to you lol"),
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "pain to you lol"),
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "pain to you lol"),
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "pain to you lol"),
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "pain to you lol"),
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "pain to you lol"),
	setUpPropertyInfos(ITEM_PROPRTY_BIO_HAAZARD, "pain to you lol"),
]

global.propertiesKind = [
	global.propertiesOfHealing,
	global.propertiesOfBoosts,
	global.propertyOfPains,
	global.propertyOfPains,
	global.propertyOfPains,
	global.propertyOfPains,
	global.propertyOfPains,
	global.propertyOfPains,
];