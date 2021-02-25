attribute vec4 Position;
attribute vec4 Color;

varying vec4 FragmentColor;

uniform mat4 Projection;
uniform mat4 LookAt;
uniform mat4 ModelView;

void main(void)
{
    FragmentColor = Color;
    gl_Position = Projection * LookAt * ModelView * Position;
}