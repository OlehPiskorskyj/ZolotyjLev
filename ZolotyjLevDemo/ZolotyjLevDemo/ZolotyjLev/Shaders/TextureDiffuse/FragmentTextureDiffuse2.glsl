varying lowp vec3 FragmentPosition;
varying lowp vec4 FragmentColor;
varying lowp vec2 FragmentTextureCoord;
varying lowp vec3 FragmentNormal;

uniform sampler2D Texture;

uniform lowp vec3 LightPosition;
uniform lowp float LightIntensity;

void main(void)
{
    lowp float distance = length(LightPosition - FragmentPosition);
    lowp vec3 lightVector = normalize(LightPosition - FragmentPosition);
    lowp float diffuse = max(dot(FragmentNormal, lightVector), 0.1);
    diffuse = diffuse * (1.0 / (1.0 + (0.1 * distance * distance)));
    diffuse = diffuse + 0.4;
    
    gl_FragColor = FragmentColor * vec4(diffuse, diffuse, diffuse, 1.0) * texture2D(Texture, FragmentTextureCoord);
}