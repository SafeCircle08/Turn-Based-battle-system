function digitNotEqualsToSpecialChars(_str, _index = string_length(_str))
{
	return ((string_char_at(_str, _index) != "?") &&
			(string_char_at(_str, _index) != "!") &&
			(string_char_at(_str, _index) != ".") &&
			(string_char_at(_str, _index) != ":") &&
			(string_char_at(_str, _index) != "(") &&
			(string_char_at(_str, _index) != ")") &&
			(string_char_at(_str, _index) != "[") &&
			(string_char_at(_str, _index) != "]") &&
			(string_char_at(_str, _index) != "}") &&
			(string_char_at(_str, _index) != "{") &&
			(string_char_at(_str, _index) != "$") &&
			(string_char_at(_str, _index) != "%") &&
			(string_char_at(_str, _index) != "/") &&
			(string_char_at(_str, _index) != "#") &&
			(string_char_at(_str, _index) != ";"));
}

function changeLastDigit(_str, _char = ".")
{
	var _stringL = string_length(_str);
	var _newString = string_copy(_str, 1, _stringL) + _char;
	return _newString + "\n";
}