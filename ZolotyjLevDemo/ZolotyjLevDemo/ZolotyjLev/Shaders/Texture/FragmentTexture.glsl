varying lowp vec4 FragmentColor;
varying lowp vec2 FragmentTextureCoord;

uniform sampler2D Texture;

void main(void)
{
    lowp vec4 textureColor = FragmentColor * texture2D(Texture, FragmentTextureCoord);
    if (textureColor.a < 0.5) discard;
    
    gl_FragColor = textureColor;
}
