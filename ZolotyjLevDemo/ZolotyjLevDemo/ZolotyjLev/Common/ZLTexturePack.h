//
//  ZLTexturePack.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 03.06.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <GLKit/GLKit.h>

@class ZLTexture;

@interface ZLTexturePack : GLKViewController
{
@private NSMutableArray *mTextures;
}

-(ZLTexturePack *)init;

-(void)addTextureWithID:(GLuint)textureID Uniform:(GLuint)textureUniform;
-(void)addTexture:(ZLTexture *)texture;
-(int)textureCount;
-(ZLTexture *)textureWithIndex:(int)index;
-(void)activateTextureWithIndex:(int)index;
-(void)activateFirstTexture;
-(void)activateLastTexture;
-(void)activateTextures;
-(void)activateTexturesWithType:(GLenum)type;

@end
