varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float _checkValue;
uniform float _softGradientValue;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
	if (texColor.r > _checkValue)
	{
		float value = smoothstep(1.0, 0.0, texColor.x);
		gl_FragColor = v_vColour * vec4(value, value, value, 1.0);
	}
	else
	{
		float value = smoothstep(0.0, 1.0, texColor.x);
		gl_FragColor = v_vColour * vec4(value, value, value, 1.0);
	}
}