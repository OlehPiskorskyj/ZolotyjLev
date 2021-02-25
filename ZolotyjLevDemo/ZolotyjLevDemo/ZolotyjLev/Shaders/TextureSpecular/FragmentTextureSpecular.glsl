varying lowp vec4 FragmentColor;
varying lowp vec2 FragmentTextureCoord;
varying lowp vec3 FragmentNormal;
varying lowp vec3 FragmentToLight;
varying lowp vec3 FragmentToCamera;

uniform sampler2D Texture;

uniform lowp vec3 LightColor;
uniform lowp float LightIntensity;
uniform lowp float ShineDemper;
uniform lowp float Reflectivity;

void main(void)
{
    lowp vec3 unitNormal = normalize(FragmentNormal);
    lowp vec3 unitToLight = normalize(FragmentToLight);
    
    lowp float nDotl = dot(unitNormal, unitToLight);
    lowp float brightness = max(nDotl, 0.0);
    lowp vec3 diffuse = brightness * LightColor * LightIntensity;
    
    lowp vec3 unitToCamera = normalize(FragmentToCamera);
    lowp vec3 lightDirection = -unitToLight;
    lowp vec3 reflectedLightDirection = reflect(lightDirection, unitNormal);
    lowp float specularFactor = dot(reflectedLightDirection, unitToCamera);
    specularFactor = max(specularFactor, 0.0);
    lowp float dampedFactor = pow(specularFactor, ShineDemper);
    lowp vec3 specular = dampedFactor * LightColor * Reflectivity;
    
    gl_FragColor = FragmentColor * vec4(diffuse, 1.0) * texture2D(Texture, FragmentTextureCoord) + vec4(specular, 1.0);
}