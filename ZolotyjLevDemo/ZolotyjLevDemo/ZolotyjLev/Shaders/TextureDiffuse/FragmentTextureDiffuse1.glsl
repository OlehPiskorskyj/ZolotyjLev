varying lowp vec4 FragmentColor;
varying lowp vec2 FragmentTextureCoord;
varying lowp vec3 FragmentNormal;
varying lowp vec3 FragmentToLight[4];
varying lowp float FragmentVisibility;

uniform sampler2D Texture;

uniform lowp vec3 LightColor[4];
uniform lowp vec3 Attenuation[4];
uniform lowp float LightIntensity[4];
uniform lowp vec3 FogColor;

void main(void)
{
    lowp vec3 unitNormal = normalize(FragmentNormal);
    lowp vec3 totalDiffuse = vec3(0.0);
    
    for (int i = 0; i < 4; i++)
    {
        lowp float distanceToLight = length(FragmentToLight[i]);
        lowp float attenuationFactor = Attenuation[i].x + (Attenuation[i].y * distanceToLight) + (Attenuation[i].z * distanceToLight * distanceToLight);
        lowp vec3 unitToLight = normalize(FragmentToLight[i]);
        lowp float nDotl = dot(unitNormal, unitToLight);
        lowp float brightness = max(nDotl, 0.2);
        
        totalDiffuse = totalDiffuse + (brightness * LightColor[i] * LightIntensity[i]) / attenuationFactor;
    }
    
    totalDiffuse = max(totalDiffuse, 0.2);
    
    lowp vec4 textureColor = texture2D(Texture, FragmentTextureCoord);
    if (textureColor.a < 0.5) discard;
  
    lowp vec4 resultColor = FragmentColor * vec4(totalDiffuse, 1.0) * textureColor;
    resultColor = mix(vec4(FogColor, 1.0), resultColor, FragmentVisibility);
    
    gl_FragColor = resultColor;
}