function arrayIndexIsValid(array, inputIndex, msg = "Index not valid")
{
	var _length = array_length(array);
	if (inputIndex < 0) || (inputIndex > _length - 1)
	{
		show_error(msg, true);
		return false;
	}
	return true;
}