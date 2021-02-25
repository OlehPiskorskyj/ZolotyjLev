attribute vec4 Position;
attribute vec4 Color;
attribute vec2 TextureCoord;
attribute vec3 Normal;

varying vec4 FragmentColor;
varying vec2 FragmentTextureCoord;
varying vec3 FragmentNormal;
varying vec3 FragmentToLight;
varying vec3 FragmentToCamera;

uniform mat4 Projection;
uniform mat4 LookAt;
uniform mat4 ModelView;

uniform vec3 LightPosition;

mat2 transpose(mat2 m)
{
    return mat2(m[0][0], m[1][0],
                m[0][1], m[1][1]);
}

mat3 transpose(mat3 m)
{
    return mat3(m[0][0], m[1][0], m[2][0],
                m[0][1], m[1][1], m[2][1],
                m[0][2], m[1][2], m[2][2]);
}

mat4 transpose(mat4 m)
{
    return mat4(m[0][0], m[1][0], m[2][0], m[3][0],
                m[0][1], m[1][1], m[2][1], m[3][1],
                m[0][2], m[1][2], m[2][2], m[3][2],
                m[0][3], m[1][3], m[2][3], m[3][3]);
}

float determinant(mat2 m)
{
    return m[0][0] * m[1][1] - m[1][0] * m[0][1];
}

float determinant(mat3 m)
{
    return
    m[0][0] * (m[1][1] * m[2][2] - m[2][1] * m[1][2]) -
    m[1][0] * (m[0][1] * m[2][2] - m[2][1] * m[0][2]) +
    m[2][0] * (m[0][1] * m[1][2] - m[1][1] * m[0][2]);
}

float determinant(mat4 m)
{
    mat2 a = mat2(m);
    mat2 b = mat2(m[2].xy,m[3].xy);
    mat2 c = mat2(m[0].zw,m[1].zw);
    mat2 d = mat2(m[2].zw,m[3].zw);
    float s = determinant(a);
    return s*determinant(d-(1.0/s)*c*mat2(a[1][1],-a[0][1],-a[1][0],a[0][0])*b);
}

mat2 inverse(mat2 m)
{
    float d = 1.0 / determinant(m) ;
    return d * mat2( m[1][1], -m[0][1], -m[1][0], m[0][0]) ;
}

mat3 inverse(mat3 m)
{
    float d = 1.0 / determinant(m) ;
    return d * mat3(m[2][2]*m[1][1] - m[1][2]*m[2][1],
                    m[1][2]*m[2][0] - m[2][2]*m[1][0],
                    m[2][1]*m[1][0] - m[1][1]*m[2][0],
                    
                    m[0][2]*m[2][1] - m[2][2]*m[0][1],
                    m[2][2]*m[0][0] - m[0][2]*m[2][0],
                    m[0][1]*m[2][0] - m[2][1]*m[0][0],
                    
                    m[1][2]*m[0][1] - m[0][2]*m[1][1],
                    m[0][2]*m[1][0] - m[1][2]*m[0][0],
                    m[1][1]*m[0][0] - m[0][1]*m[1][0]
                    );
}

mat4 inverse(mat4 m)
{
    mat2 a = inverse(mat2(m));
    mat2 b = mat2(m[2].xy,m[3].xy);
    mat2 c = mat2(m[0].zw,m[1].zw);
    mat2 d = mat2(m[2].zw,m[3].zw);
    
    mat2 t = c*a;
    mat2 h = inverse(d - t*b);
    mat2 g = - h*t;
    mat2 f = - a*b*h;
    mat2 e = a - f*t;
    
    return mat4(vec4(e[0],g[0]), vec4(e[1],g[1]),
                vec4(f[0],h[0]), vec4(f[1],f[1]));
}

void main(void)
{
    vec4 worlPosition = ModelView * Position;
    
    FragmentColor = Color;
    FragmentTextureCoord = TextureCoord;
    FragmentNormal = (ModelView * vec4(Normal, 0.0)).xyz;
    FragmentToLight = LightPosition - (worlPosition).xyz;
    FragmentToCamera = (inverse(LookAt) * vec4(0.0, 0.0, 0.0, 1.0)).xyz - worlPosition.xyz;
    
    gl_Position = Projection * LookAt * worlPosition;
}