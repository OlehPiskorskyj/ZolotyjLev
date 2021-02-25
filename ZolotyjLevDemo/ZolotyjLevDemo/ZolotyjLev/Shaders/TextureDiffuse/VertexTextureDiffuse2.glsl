attribute vec4 Position;
attribute vec4 Color;
attribute vec2 TextureCoord;
attribute vec3 Normal;

varying vec3 FragmentPosition;
varying vec4 FragmentColor;
varying vec2 FragmentTextureCoord;
varying vec3 FragmentNormal;

uniform mat4 Projection;
uniform mat4 LookAt;
uniform mat4 ModelView;

void main(void)
{
    FragmentPosition = vec3(ModelView * Position);                      // light fixed
    //FragmentPosition = vec3(LookAt * ModelView * Position);             // light move with camera
    FragmentColor = Color;
    FragmentTextureCoord = TextureCoord;
    FragmentNormal = vec3(ModelView * vec4(Normal, 0.0));
    
    gl_Position = Projection * LookAt * ModelView * Position;
}