if (keyboard_check(vk_enter))
{
	setColorCheckShader(shChangeColor, "_checkValue", 0.7, "_softGradientValue", 0.5);
	exit;
}

draw_self();