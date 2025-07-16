function setColorCheckShader(_shader, _strShaderUniform, _shaderUniformValue, _gradientUniform, _gradientUniformValue)
{
	shader_set(_shader);
	draw_self();
	
	var _shaderUniform = shader_get_uniform(_shader, _strShaderUniform);
	shader_set_uniform_f(_shaderUniform, _shaderUniformValue);
	var _shaderGradient = shader_get_uniform(_shader, _gradientUniform);
	shader_set_uniform_f(_shaderGradient, _gradientUniformValue);
	
	shader_reset();
}