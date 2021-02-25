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
uniform vec3 LightPosition[4];
uniform vec3 LightColor[4];
uniform vec3 Attenuation[4];
uniform float LightIntensity[4];
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
    
    for (int i = 0; i < 4; i++)
    {
        vec3 toLight = LightPosition[i] - worlPosition.xyz;
        
        float distanceToLight = length(toLight);
        float attenuationFactor = Attenuation[i].x + (Attenuation[i].y * distanceToLight) + (Attenuation[i].z * distanceToLight * distanceToLight);
        vec3 unitToLight = normalize(toLight);
        float nDotl = dot(unitNormal, unitToLight);
        float brightness = max(nDotl, 0.6);
        totalDiffuse = totalDiffuse + (brightness * LightColor[i] * LightIntensity[i]) / attenuationFactor;
    }
    
    FragmentAlpha = Alpha;
    FragmentDiffuse = max(totalDiffuse, 0.6);
    FragmentVisibility = exp(-pow((length(positionToCamera.xyz) * FogDensity), FogGradient));
    FragmentVisibility = clamp(FragmentVisibility, 0.0, 1.0);
    
    gl_Position = Projection * LookAt * worlPosition;
}
