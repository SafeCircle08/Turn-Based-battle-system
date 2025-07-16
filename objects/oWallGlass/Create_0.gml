myTextTrigger = instance_place(x, y, oTextTrigger);



createShards = function()
{
	var _shardArray = 
	[
		oGlassShard_1,
		oGlassShard_2,
		oGlassShard_3, 
		oGlassShard_4,
		oGlassShard_5,
		oGlassShard_6,
		oGlassShard_7
	];
	
	//Creates the shards
	for (var i = 0; i < array_length(_shardArray); i++)
	{
		instance_create_layer(x, y, "Text", _shardArray[i]);	
	}
	instance_destroy(myTextTrigger);
	instance_destroy(self);
}	