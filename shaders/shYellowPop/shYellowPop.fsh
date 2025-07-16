// fragment shader
precision mediump float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time; // 0 to 1

void main() {
    vec4 base_col = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    // Ease in-out (smoothstep)
    float t = u_time;
    float ease = t * t * (3.0 - 2.0 * t); // smoothstep-like

    // Pop color: mix with yellow
    vec3 yellow = vec3(1.0, 1.0, 0.0);

    vec3 final_col = mix(base_col.rgb, yellow, ease);

    gl_FragColor = vec4(final_col, base_col.a);
}