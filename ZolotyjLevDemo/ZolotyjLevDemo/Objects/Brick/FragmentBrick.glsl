varying lowp vec2 FragmentTextureCoord;
varying lowp vec3 FragmentDiffuse;
varying lowp float FragmentAlpha;
varying lowp float FragmentVisibility;

uniform sampler2D Texture;

uniform lowp vec3 FogColor;
uniform lowp vec3 TintColor;
uniform lowp float TintColorIntensity;

void main(void)
{
    lowp vec4 textureColor = texture2D(Texture, FragmentTextureCoord);
    if (textureColor.a < 0.5) discard;
    
    lowp vec4 resultColor = vec4(FragmentDiffuse, 1.0) * textureColor;
    resultColor = mix(resultColor, vec4(TintColor, 1.0), TintColorIntensity);
    resultColor = mix(vec4(FogColor, 1.0), resultColor, FragmentVisibility);
    resultColor.a = FragmentAlpha;
    
    gl_FragColor = resultColor;
}
