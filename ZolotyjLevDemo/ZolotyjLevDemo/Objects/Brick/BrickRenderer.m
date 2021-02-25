//
//  BrickRenderer.m
//  Czarocvit
//
//  Created by Oleh Piskorskyj on 01.12.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "BrickRenderer.h"
#import "ZLCamera.h"
#import "Brick.h"
#import "Consts.h"

@implementation BrickRenderer

#pragma mark Ctors/Dtor
-(BrickRenderer *)init
{
    self = [super init];
    return self;
}

-(void)dealloc
{
    [super dealloc];
}

#pragma mark - Override methods
-(void)initialize
{
    [super initialize];
    
    mShader = [[ZLShader alloc] init];
    [mShader setVertexShaderName:@"VertexBrick"];
    [mShader setFragmantShaderName:@"FragmentBrick"];
    [mShader compile];
    
    mPositionSlot = [mShader attributeWithName:ZL_CONSTS_SHADER_ATTRIBUTE_POSITION];
    mTextureCoordSlot = [mShader attributeWithName:ZL_CONSTS_SHADER_ATTRIBUTE_TEXTURE_COORD];
    mNormalSlot = [mShader attributeWithName:ZL_CONSTS_SHADER_ATTRIBUTE_NORMAL];
    
    mProjectionUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_PROJECTION];
    mLookAtUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_LOOK_AT];
    mModelViewUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_MODEL_VIEW];
    mLightPositionUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_LIGHT_POSITION];
    mLightColourUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_LIGHT_COLOR];
    mLightAttenuationUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_LIGHT_ATTENUATION];
    mLightIntensityUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_LIGHT_INTENSITY];
    mFogColorUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_FOG_COLOR];
    mTintColorUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_TINT_COLOR];
    mTintColorIntensityUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_TINT_COLOR_INTENSITY];
    mAlphaUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_ALPHA];
    mTextureCoordOffsetUniform = [mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_TEXTURE_COORD_OFFSET];
    
    mTexture = [super createTexureWithName:@"tx_brick.jpg"];
    
    mVerticesDataSize = sizeof(Vertex) * CONSTS_GEOMETRY_CUBE_VERTICES_COUNT;
    mVerticesData = malloc(mVerticesDataSize);
    mVerticesCount = 0;
    
    GLuint indicesDataSize = sizeof(GLuint) * CONSTS_GEOMETRY_CUBE_INDICES_COUNT;
    GLuint indicesDataCount = 0;
    GLuint *indicesData = malloc(indicesDataSize);
    GLuint lastIndex = 0;
    
    [self addVertex:&(Vertex){{-mSize / 2.0f, mSize, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 0.0f}, {0.0f, 0.0f, 1.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, mSize, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 0.0f}, {0.0f, 0.0f, 1.0f}}];
    [self addVertex:&(Vertex){{-mSize / 2.0f, 0.0f, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {0.0f, 0.0f, 1.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, 0.0f, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {0.0f, 0.0f, 1.0f}}];
    
    [self addVertex:&(Vertex){{ mSize / 2.0f, mSize, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 0.0f}, {1.0f, 0.0f, 0.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, mSize,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 0.0f}, {1.0f, 0.0f, 0.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, 0.0f, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {1.0f, 0.0f, 0.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, 0.0f,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {1.0f, 0.0f, 0.0f}}];
    
    [self addVertex:&(Vertex){{-mSize / 2.0f, mSize,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 0.0f}, {0.0f, 0.0f, -1.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, mSize,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 0.0f}, {0.0f, 0.0f, -1.0f}}];
    [self addVertex:&(Vertex){{-mSize / 2.0f, 0.0f,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {0.0f, 0.0f, -1.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, 0.0f,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {0.0f, 0.0f, -1.0f}}];
    
    [self addVertex:&(Vertex){{-mSize / 2.0f, mSize, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 0.0f}, {-1.0f, 0.0f, 0.0f}}];
    [self addVertex:&(Vertex){{-mSize / 2.0f, mSize,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 0.0f}, {-1.0f, 0.0f, 0.0f}}];
    [self addVertex:&(Vertex){{-mSize / 2.0f, 0.0f, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {-1.0f, 0.0f, 0.0f}}];
    [self addVertex:&(Vertex){{-mSize / 2.0f, 0.0f,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {-1.0f, 0.0f, 0.0f}}];
    
    [self addVertex:&(Vertex){{-mSize / 2.0f, mSize,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, mSize,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 0.0f}, {0.0f, 1.0f, 0.0f}}];
    [self addVertex:&(Vertex){{-mSize / 2.0f, mSize, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {0.0f, 1.0f, 0.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, mSize, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {0.0f, 1.0f, 0.0f}}];
    
    [self addVertex:&(Vertex){{-mSize / 2.0f, 0.0f,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 0.0f}, {0.0f, -1.0f, 0.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, 0.0f,-mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 0.0f}, {0.0f, -1.0f, 0.0f}}];
    [self addVertex:&(Vertex){{-mSize / 2.0f, 0.0f, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {0.0f, -1.0f, 0.0f}}];
    [self addVertex:&(Vertex){{ mSize / 2.0f, 0.0f, mSize / 2.0f}, {1.0f, 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {0.0f, -1.0f, 0.0f}}];
    
    [ZLToolbox addModelIndicesWithType:ModelType_CUBE IndicesData:indicesData IndicesOffset:&indicesDataCount FirstIndex:&lastIndex];
    
    glGenVertexArraysOES(1, &mVertexArray);
    glBindVertexArrayOES(mVertexArray);
    
    glGenBuffers(1, &mVertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, mVertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, mVerticesDataSize, mVerticesData, GL_STATIC_DRAW);
    
    glGenBuffers(1, &mIndexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, mIndexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indicesDataSize, indicesData, GL_STATIC_DRAW);
    
    [ZLToolbox add2VertexArrayPositionSlot:&mPositionSlot TextureCoordSlot:&mTextureCoordSlot NormalSlot:&mNormalSlot];
    
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
    glBindVertexArrayOES(0);
}

#pragma mark - Public methods
-(void)prepareToRender
{
    [super prepareToRender];
    
    glEnable(GL_CULL_FACE);
    glEnable(GL_BLEND);
    glDisable(GL_BLEND);
    
    glBindVertexArrayOES(mVertexArray);
    glBindBuffer(GL_ARRAY_BUFFER, mVertexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, mIndexBuffer);
    glUseProgram([mShader handler]);
    
    glUniformMatrix4fv(mProjectionUniform, 1, 0, [[ZLCamera instance] projection]->m);
    
    GLKMatrix4 lookAt = [[ZLCamera instance] view];
    glUniformMatrix4fv(mLookAtUniform, 1, 0, lookAt.m);
    
    glUniform3f(mFogColorUniform, CONSTS_COLOR_FOG_LIGHT_RED, CONSTS_COLOR_FOG_LIGHT_GREEN, CONSTS_COLOR_FOG_LIGHT_BLUE);
    [super loadLight:mStaticLight];
    
    glUniform3f(mTintColorUniform, CONSTS_COLOR_TINT_RED, CONSTS_COLOR_TINT_GREEN, CONSTS_COLOR_TINT_BLUE);
    
    if (mTexture)
        [mTexture activate];
}

-(void)renderBrick:(Brick *)brick
{
    GLKMatrix4 modelView = GLKMatrix4Multiply(GLKMatrix4MakeTranslation([brick positionX], [brick positionY], [brick positionZ]), GLKMatrix4MakeRotation([brick rotationAngle], [brick rotationX], [brick rotationY], [brick rotationZ]));
    modelView = GLKMatrix4Multiply(modelView, GLKMatrix4MakeScale([brick scaleX], [brick scaleY], [brick scaleZ]));
    glUniformMatrix4fv(mModelViewUniform, 1, 0, modelView.m);
    glUniform2f(mTextureCoordOffsetUniform, [brick textureOffsetX], [brick textureOffsetY]);
    glUniform1f(mAlphaUniform, [brick alpha]);
    glUniform1f(mTintColorIntensityUniform, [brick tintColorIntensity]);
    glDrawElements(GL_TRIANGLES, CONSTS_GEOMETRY_CUBE_INDICES_COUNT, GL_UNSIGNED_INT, NULL);
}

#pragma mark - Other methods
-(void)addVertex:(Vertex *)vertex
{
    if (mVerticesCount >= mVerticesDataSize / sizeof(vertex))
        return;
    
    mVerticesData[mVerticesCount] = *vertex;
    mVerticesCount++;
}

@end
