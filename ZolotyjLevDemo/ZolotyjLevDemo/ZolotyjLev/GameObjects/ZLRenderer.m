//
//  ZLRenderer.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 09.06.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLRenderer.h"
#import "ZLObject.h"
#import "ZLShader.h"
#import "ZLTexture.h"

@implementation ZLRenderer

#pragma mark - Ctors/Dtor
-(ZLRenderer *)init
{
    self = [super init];
    if (self) [self initialize];
    return self;
}

-(void)dealloc
{
    if (mLightsPositionsUniforms) [mLightsPositionsUniforms release];
    if (mLightsColoursUniforms) [mLightsColoursUniforms release];
    if (mLightsAttenuationsUniforms) [mLightsAttenuationsUniforms release];
    if (mLightsIntensitiesUniforms) [mLightsIntensitiesUniforms release];
    if (mShader) [mShader release];
    if (mTexture) [mTexture release];
    if (mStaticLights) [mStaticLights release];
    [super dealloc];
}

#pragma mark - Public methods
-(void)initialize
{
    mSize = 1.0f;
}

-(void)prepareToRender
{
}

-(void)createVAOWithVerticesData:(void *)verticesData VerticesDataSize:(GLuint)verticesDataSize IndicesData:(GLuint *)indicesData IndicesDataSize:(GLuint)indicesDataSize
{
}

-(void)createVAOWithVerticesData:(void *)verticesData VerticesDataSize:(GLuint)verticesDataSize
{
}

-(void)createVAOWithVerticesData:(ZLVerticesData *)verticesData IndicesData:(ZLIndicesData *)indicesData
{
}

-(void)updateVAOWithVerticesData:(ZLVerticesData *)verticesData IndicesData:(ZLIndicesData *)indicesData
{
}

-(void)renderObject:(ZLObject *)object
{
}

-(ZLTexture *)createTexureWithName:(NSString *)textureName
{
    ZLTexture *texture = NULL;
    if (mShader && textureName && ![textureName isEqualToString:@""])
    {
        texture = [[ZLTexture alloc] init];
        [texture setTextureID:[ZLTexture textureWithName:textureName]];
        [texture setTextureUniform:[mShader uniformWithName:ZL_CONSTS_SHADER_UNIFORM_TEXTURE]];
    }
    return texture;
}

-(void)loadLights:(NSArray *)lights
{
    for (int i = 0; i < [lights count]; i++)
    {
        if (i < ZL_CONSTS_LIGHTS_QUANTITY)
        {
            ZLLight *light = [lights objectAtIndex:i];
            glUniform3f([[mLightsPositionsUniforms objectAtIndex:i] unsignedIntValue], [light positionX], [light positionY], [light positionZ]);
            glUniform3f([[mLightsColoursUniforms objectAtIndex:i] unsignedIntValue], [light colorR], [light colorG], [light colorB]);
            glUniform3f([[mLightsAttenuationsUniforms objectAtIndex:i] unsignedIntValue], [light attenuation1], [light attenuation2], [light attenuation3]);
            glUniform1f([[mLightsIntensitiesUniforms objectAtIndex:i] unsignedIntValue], [light intensivity]);
        }
        else
        {
            break;
        }
    }
}

-(void)loadLight:(ZLLight *)light
{
    glUniform3f(mLightPositionUniform, [light positionX], [light positionY], [light positionZ]);
    glUniform3f(mLightColourUniform, [light colorR], [light colorG], [light colorB]);
    glUniform3f(mLightAttenuationUniform, [light attenuation1], [light attenuation2], [light attenuation3]);
    glUniform1f(mLightIntensityUniform, [light intensivity]);
}

-(void)setStaticLights:(NSArray *)lights
{
    if (mStaticLights != lights)
    {
        if (mStaticLights)
            [mStaticLights release];
        [lights retain];
        mStaticLights = lights;
    }
}

-(void)setStaticLight:(ZLLight *)light
{
    if (mStaticLight != light)
    {
        if (mStaticLight)
            [mStaticLight release];
        [light retain];
        mStaticLight = light;
    }
}

-(void)setTexture:(ZLTexture *)texture
{
    if (mTexture != texture)
    {
        if (mTexture)
            [mTexture release];
        [texture retain];
        mTexture = texture;
    }
}

-(void)setTexturePack:(ZLTexturePack *)texturePack
{
    if (mTexturePack != texturePack)
    {
        if (mTexturePack)
            [mTexturePack release];
        [texturePack retain];
        mTexturePack = texturePack;
    }
}

-(NSArray *)staticLights
{
    return mStaticLights;
}

-(ZLLight *)staticLight
{
    return mStaticLight;
}

-(ZLTexture *)texture
{
    return mTexture;
}

-(ZLTexturePack *)texturePack
{
    return mTexturePack;
}

@end
