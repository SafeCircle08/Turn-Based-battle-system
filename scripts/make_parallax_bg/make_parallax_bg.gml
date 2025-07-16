/*
	-------------------------------------------------------------
	-------------------------------------------------------------
	REMEMBER TO CHECK IF THIS WORKS WITH MULTIPLE LAYER SPECIFIED
	-------------------------------------------------------------
	-------------------------------------------------------------
	(In rmBannerBridge the TreeBG and the Structures BG does not
	 appear to be working properly...)
*/




//It gets out of a function by showing a message error 
function exit_parallax_function(_showErrorMsg = true)
{
	if (_showErrorMsg)
	{
		var _str = "A specfied layer in the function does not appear to exist...";
		show_error(_str, false);		
	}
}

//If a specified layer doesnt exist (might have written it wrong or forgot to remove it)
//It will call the function to actually exit the function, 
//In order not to execute it.
function menage_layer_not_existing(_l1, _l2, _l3, _l4, _l5, _l6, _l7)
{
	if (!layer_exists(_l1) && (_l1 != "")) { exit_parallax_function(); }
	if (!layer_exists(_l2) && (_l2 != "")) { exit_parallax_function(); }
	if (!layer_exists(_l3) && (_l3 != "")) { exit_parallax_function(); }
	if (!layer_exists(_l4) && (_l4 != "")) { exit_parallax_function(); }
	if (!layer_exists(_l5) && (_l5 != "")) { exit_parallax_function(); }
	if (!layer_exists(_l6) && (_l6 != "")) { exit_parallax_function(); }
	if (!layer_exists(_l7) && (_l7 != "")) { exit_parallax_function(); }	
}

//Can handle a max of 7 different layers
//Amount list is the list of how much everylayer should move
function make_parallax_bg(side = "x", _amountList = [], _sign = [], _l1 = "", _l2 = "", _l3 = "", _l4 = "", _l5 = "", _l6 = "", _l7 = "")
{
	
	menage_layer_not_existing(_l1, _l2, _l3, _l4, _l5, _l6, _l7);
	
	if (side == "x")
	{
		//Where the x axis parallax movement is menaged	
		if (_l1 != "") { layer_x(_l1, (oCamera.finalCamX * _sign[0]) / _amountList[0]); }
		if (_l2 != "") { layer_x(_l2, (oCamera.finalCamX * _sign[1]) / _amountList[1]); }
		if (_l3 != "") { layer_x(_l3, (oCamera.finalCamX * _sign[2]) / _amountList[2]); }
		if (_l4 != "") { layer_x(_l4, (oCamera.finalCamX * _sign[3]) / _amountList[3]); }
		if (_l5 != "") { layer_x(_l5, (oCamera.finalCamX * _sign[4]) / _amountList[4]); }
		if (_l6 != "") { layer_x(_l6, (oCamera.finalCamX * _sign[5]) / _amountList[5]); }
		if (_l7 != "") { layer_x(_l7, (oCamera.finalCamX * _sign[6]) / _amountList[6]); }
	}
	else
	{
		//Where the y axis parallax movement is menaged
		if (_l1 != "") { layer_y(_l1, (oCamera.finalCamY * _sign[0]) / _amountList[0]); }
		if (_l2 != "") { layer_y(_l2, (oCamera.finalCamY * _sign[1]) / _amountList[1]); }
		if (_l3 != "") { layer_y(_l3, (oCamera.finalCamY * _sign[2]) / _amountList[2]); }
		if (_l4 != "") { layer_y(_l4, (oCamera.finalCamY * _sign[3]) / _amountList[3]); }
		if (_l5 != "") { layer_y(_l5, (oCamera.finalCamY * _sign[4]) / _amountList[4]); }
		if (_l6 != "") { layer_y(_l6, (oCamera.finalCamY * _sign[5]) / _amountList[5]); }
		if (_l7 != "") { layer_y(_l7, (oCamera.finalCamY * _sign[6]) / _amountList[6]); }	
	}
}