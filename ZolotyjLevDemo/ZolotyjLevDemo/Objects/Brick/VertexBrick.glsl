attribute vec4 Position;
attribute vec2 TextureCoord;
attribute vec3 Normal;

varying vec2 FragmentTextureCoord;
varying vec3 FragmentDiffuse;
varying float FragmentAlpha;
varying float FragmentVisibility;

uniform mat4 Projection;
uniform mat4 LookAt;
uniform mat4 ModelView;
uniform vec3 LightPosition;
uniform vec3 LightColor;
uniform vec3 LightAttenuation;
uniform float LightIntensity;
uniform vec2 TextureCoordOffset;
uniform float Alpha;

const float FogDensity = 0.009;
const float FogGradient = 16.0;

void main(void)
{
    vec4 worlPosition = ModelView * Position;
    vec4 positionToCamera = LookAt * worlPosition;
    
    FragmentTextureCoord = TextureCoord + TextureCoordOffset;
    
    vec3 normal = (ModelView * vec4(Normal, 0.0)).xyz;
    vec3 unitNormal = normalize(normal);
    vec3 totalDiffuse = vec3(0.0);
    
    vec3 toLight = LightPosition - worlPosition.xyz;
    float distanceToLight = length(toLight);
    float attenuationFactor = LightAttenuation.x + (LightAttenuation.y * distanceToLight) + (LightAttenuation.z * distanceToLight * distanceToLight);
    vec3 unitToLight = normalize(toLight);
    float nDotl = dot(unitNormal, unitToLight);
    float brightness = max(nDotl, 0.6);
    totalDiffuse = totalDiffuse + (brightness * LightColor * LightIntensity) / attenuationFactor;
    
    FragmentDiffuse = max(totalDiffuse, 0.6);
    FragmentVisibility = exp(-pow((length(positionToCamera.xyz) * FogDensity), FogGradient));
    FragmentVisibility = clamp(FragmentVisibility, 0.0, 1.0);
    FragmentAlpha = Alpha;
    
    gl_Position = Projection * LookAt * worlPosition;
}
