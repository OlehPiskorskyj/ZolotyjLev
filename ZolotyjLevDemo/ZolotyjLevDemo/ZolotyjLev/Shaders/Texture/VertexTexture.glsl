attribute vec4 Position;
attribute vec4 Color;
attribute vec2 TextureCoord;

varying vec4 FragmentColor;
varying vec2 FragmentTextureCoord;

uniform mat4 Projection;
uniform mat4 LookAt;
uniform mat4 ModelView;
uniform vec2 TextureCoordOffset;

void main(void)
{
    FragmentColor = Color;
    FragmentTextureCoord = TextureCoord + TextureCoordOffset;
    
    gl_Position = Projection * LookAt * ModelView * Position;
}
