varying lowp vec4 FragmentColor;
varying lowp float FragmentVisibility;

uniform lowp vec3 FogColor;

void main(void)
{
    lowp vec4 resultColor = mix(vec4(FogColor, 1.0), FragmentColor, FragmentVisibility);
    gl_FragColor = resultColor;
}
