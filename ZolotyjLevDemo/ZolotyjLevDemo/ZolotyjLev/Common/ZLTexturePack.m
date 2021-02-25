//
//  ZLTexturePack.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 03.06.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLTexturePack.h"
#import "ZLTexture.h"

@implementation ZLTexturePack

#pragma mark - Ctors/Dtor
-(ZLTexturePack *)init
{
    self = [super init];
    if (self) [self internalInit];
    return self;
}

-(void)internalInit
{
    mTextures = [[NSMutableArray alloc] init];
}

-(void)dealloc
{
    if (mTextures) [mTextures release];
    [super dealloc];
}

#pragma mark - Public methods
-(void)addTextureWithID:(GLuint)textureID Uniform:(GLuint)textureUniform
{
    ZLTexture *texture = [[ZLTexture alloc] init];
    [texture setTextureID:textureID];
    [texture setTextureUniform:textureUniform];
    [self addTexture:texture];
}

-(void)addTexture:(ZLTexture *)texture
{
    if (texture)
    {
        [mTextures addObject:texture];
        [texture release];
    }
}

-(int)textureCount
{
    return (int)[mTextures count];
}

-(ZLTexture *)textureWithIndex:(int)index
{
    return [mTextures objectAtIndex:index];
}

-(void)activateTextureWithIndex:(int)index
{
    [[self textureWithIndex:index] activate];
}

-(void)activateFirstTexture
{
    [[mTextures firstObject] activate];
}

-(void)activateLastTexture
{
    [[mTextures lastObject] activate];
}

-(void)activateTextures
{
    [self activateTexturesWithType:GL_TEXTURE_2D];
}

-(void)activateTexturesWithType:(GLenum)type
{
    if (type == GL_TEXTURE_CUBE_MAP)
        glEnable(GL_TEXTURE_CUBE_MAP);
    
    int textureIndex = GL_TEXTURE0;
    for (int i = 0; i < [mTextures count]; i++)
    {
        glActiveTexture(textureIndex);
        glBindTexture(type, [[self textureWithIndex:i] textureID]);
        glUniform1i([[self textureWithIndex:i] textureUniform], i);
        textureIndex++;
    }
}

#pragma mark - Other methods

@end
