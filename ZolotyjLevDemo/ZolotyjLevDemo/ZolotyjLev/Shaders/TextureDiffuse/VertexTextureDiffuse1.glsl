attribute vec4 Position;
attribute vec4 Color;
attribute vec2 TextureCoord;
attribute vec3 Normal;

varying vec4 FragmentColor;
varying vec3 FragmentNormal;
varying vec3 FragmentToLight[4];
varying vec2 FragmentTextureCoord;
varying float FragmentVisibility;

uniform mat4 Projection;
uniform mat4 LookAt;
uniform mat4 ModelView;
uniform vec3 LightPosition[4];
uniform vec2 TextureCoordOffset;
uniform float TextureRowsCount;

const float FogDensity = 0.009;
const float FogGradient = 16.0;

void main(void)
{
    vec4 worlPosition = ModelView * Position;
    vec4 positionToCamera = LookAt * worlPosition;
    
    FragmentColor = Color;
    FragmentNormal = (ModelView * vec4(Normal, 0.0)).xyz;
    for (int i = 0; i < 4; i++)
    {
        FragmentToLight[i] = LightPosition[i] - worlPosition.xyz;
    }
    FragmentTextureCoord = (TextureCoord / TextureRowsCount) + TextureCoordOffset;
    
    FragmentVisibility = exp(-pow((length(positionToCamera.xyz) * FogDensity), FogGradient));
    FragmentVisibility = clamp(FragmentVisibility, 0.0, 1.0);
    
    gl_Position = Projection * LookAt * worlPosition;
}