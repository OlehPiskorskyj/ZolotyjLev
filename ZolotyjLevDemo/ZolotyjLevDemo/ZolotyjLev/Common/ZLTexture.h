//
//  ZLTexture.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 03.06.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

typedef enum {
    ZLTexturePixelFormat_RGBA8888,
    ZLTexturePixelFormat_RGB565,
    ZLTexturePixelFormat_RGB888,
    ZLTexturePixelFormat_DEFAULT = ZLTexturePixelFormat_RGBA8888,
} ZLTexturePixelFormat;

@interface ZLTexture : NSObject
{
@private GLuint mTextureID;
@private GLuint mTextureUniform;
    
@private int mRowsCount;
}

-(ZLTexture *)init;

-(void)setTextureID:(GLuint)textureID;
-(void)setTextureUniform:(GLuint)textureUniform;
-(void)setRowsCount:(int)rowsCount;
-(GLuint)textureID;
-(GLuint)textureUniform;
-(int)rowsCount;
-(void)activate;
-(void)activateWithType:(GLenum)type;

+(GLuint)textureWithName:(NSString *)name;
+(GLuint)textureWithName:(NSString *)name Type:(GLenum)type;

@end
