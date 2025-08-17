varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_GlintTex;
uniform vec2  u_offset;
uniform float u_angle;
uniform float u_scale;
uniform vec4  u_tint;
uniform float u_strength;

uniform sampler2D u_sampler;

void main()
{
    vec4 baseCol = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    // ignora pixel trasparenti
    if (baseCol.a <= 0.0) discard;

    // calcolo rotazione UV
    float sinA = sin(u_angle);
    float cosA = cos(u_angle);

    vec2 uv = v_vTexcoord - 0.5; // centro per la rotazione
    vec2 rotUV;
    rotUV.x = cosA * uv.x - sinA * uv.y;
    rotUV.y = sinA * uv.x + cosA * uv.y;

    vec2 glintUV = rotUV * u_scale + 0.5 + u_offset;

    // campiona texture glint (grayscale sul canale rosso)
    float glintVal = texture2D(u_GlintTex, glintUV).r;

    // colore finale
    vec3 glintColor = u_tint.rgb * glintVal * u_strength * baseCol.a;
    gl_FragColor = vec4(baseCol.rgb + glintColor, baseCol.a);
}