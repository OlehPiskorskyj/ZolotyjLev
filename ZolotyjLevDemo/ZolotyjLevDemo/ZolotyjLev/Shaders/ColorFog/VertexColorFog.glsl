attribute vec4 Position;
attribute vec4 Color;

varying vec4 FragmentColor;
varying float FragmentVisibility;

uniform mat4 Projection;
uniform mat4 LookAt;
uniform mat4 ModelView;

const float FogDensity = 0.0025;
const float FogGradient = 16.0;

void main(void)
{
    vec4 worlPosition = ModelView * Position;
    vec4 positionToCamera = LookAt * worlPosition;
    
    FragmentColor = Color;
    
    FragmentVisibility = exp(-pow((length(positionToCamera.xyz) * FogDensity), FogGradient));
    FragmentVisibility = clamp(FragmentVisibility, 0.0, 1.0);
    
    gl_Position = Projection * LookAt * worlPosition;
}
