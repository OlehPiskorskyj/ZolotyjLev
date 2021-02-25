//
//  ZLTexture.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 03.06.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLTexture.h"
#import "ZLToolbox.h"

@implementation ZLTexture

#pragma mark - Ctors/Dtor
-(ZLTexture *)init
{
    self = [super init];
    if (self) [self internalInit];
    return self;
}

-(void)internalInit
{
    mRowsCount = 1;
    mTextureID = 0;
}

-(void)dealloc
{
    if (mTextureID) glDeleteTextures(1, &mTextureID);
    [super dealloc];
}

#pragma mark - Public methods
-(void)setTextureID:(GLuint)textureID
{
    mTextureID = textureID;
}

-(void)setTextureUniform:(GLuint)textureUniform
{
    mTextureUniform = textureUniform;
}

-(void)setRowsCount:(int)rowsCount
{
    mRowsCount = rowsCount;
}

-(GLuint)textureID
{
    return mTextureID;
}

-(GLuint)textureUniform
{
    return mTextureUniform;
}

-(int)rowsCount
{
    return mRowsCount;
}

-(void)activate
{
    [self activateWithType:GL_TEXTURE_2D];
}

-(void)activateWithType:(GLenum)type
{
    if (type == GL_TEXTURE_CUBE_MAP)
        glEnable(GL_TEXTURE_CUBE_MAP);
    
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(type, mTextureID);
    glUniform1i(mTextureUniform, 0);
}

#pragma mark - Static methods
+(GLuint)textureWithName:(NSString *)name
{
    return [ZLTexture textureWithName:name Type:GL_TEXTURE_2D];
}

+(GLuint)textureWithName:(NSString *)name Type:(GLenum)type
{
    GLuint textureID = 0;
    if (type == GL_TEXTURE_2D)
    {
        UIImage *imageUI = [ZLToolbox imageWithName:name];
        CGImageRef image = [imageUI CGImage];
        if (image)
        {
            ZLTexturePixelFormat pixelFormat = ZLTexturePixelFormat_RGBA8888;
            
            size_t width = CGImageGetWidth(image);
            size_t height = CGImageGetHeight(image);
            size_t bitsPerPixel = CGImageGetBitsPerComponent(image);
            
            CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(image);
            BOOL hasAlpha = alphaInfo == kCGImageAlphaPremultipliedLast || alphaInfo == kCGImageAlphaPremultipliedFirst || alphaInfo == kCGImageAlphaLast || alphaInfo == kCGImageAlphaFirst;
            if (!hasAlpha)
                pixelFormat = ZLTexturePixelFormat_RGB565;
            
            void *data = malloc(width * height * 4);
            CGContextRef context = CGBitmapContextCreate(data, width, height, bitsPerPixel, width * 4, CGImageGetColorSpace(image), alphaInfo);
            CGContextDrawImage(context, CGRectMake(0, 0, width, height), image);
            CGContextRelease(context);
            
            glGenTextures(1, &textureID);
            glBindTexture(GL_TEXTURE_2D, textureID);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
            
            if (pixelFormat == ZLTexturePixelFormat_RGB888)
            {
                void *tempData = malloc(width * height * 3);
                char *inData = (char *)data;
                char *outData = (char *)tempData;
                int j = 0;
                for (unsigned int i = 0; i < width * height * 4; i++)
                {
                    outData[j++] = inData[i++];
                    outData[j++] = inData[i++];
                    outData[j++] = inData[i++];
                }
                free(data);
                data = tempData;
                
                glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, (GLsizei)width, (GLsizei)height, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
            }
            else if (pixelFormat == ZLTexturePixelFormat_RGB565)
            {
                void *tempData = malloc(width * height * 2);
                unsigned int *inPixel32 = (unsigned int *)data;
                unsigned short *outPixel16 = (unsigned short *)tempData;
                for (unsigned int i = 0; i < width * height; ++i, ++inPixel32)
                {
                    *outPixel16++ = ((((*inPixel32 >> 0) & 0xFF) >> 3) << 11) | ((((*inPixel32 >> 8) & 0xFF) >> 2) << 5) | ((((*inPixel32 >> 16) & 0xFF) >> 3) << 0);
                }
                free(data);
                data = tempData;
                
                glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, (GLsizei)width, (GLsizei)height, 0, GL_RGB, GL_UNSIGNED_SHORT_5_6_5, data);
            }
            else
            {
                glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (int)width, (int)height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
            }
            
            free(data);
        }
        [imageUI release];
    }
    else if (type == GL_TEXTURE_CUBE_MAP)
    {
        glGenTextures(1, &textureID);
        glBindTexture(GL_TEXTURE_CUBE_MAP, textureID);
        
        for (int i = 0; i < 6; i++)
        {
            NSArray *nameComponents = [name componentsSeparatedByString:@"."];
            if ([nameComponents count] > 1)
            {
                CGImageRef image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@%d.%@", [nameComponents firstObject], i, [nameComponents lastObject]]] CGImage];
                if (image)
                {
                    size_t width = CGImageGetWidth(image);
                    size_t height = CGImageGetHeight(image);
                    
                    GLubyte *data = (GLubyte *)calloc(width * height * 4, sizeof(GLubyte));
                    CGContextRef context = CGBitmapContextCreate(data, width, height, 8, width * 4, CGImageGetColorSpace(image), kCGImageAlphaPremultipliedLast);
                    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image);
                    CGContextRelease(context);
                    
                    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
                    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
                    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
                    glTexParameteri(GL_TEXTURE_CUBE_MAP, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
                    
                    glTexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_X + i, 0, GL_RGBA, (int)width, (int)height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
                    
                    free(data);
                }
            }
        }
    }
    
    if (!textureID) NSLog(@"Texture error");
    return textureID;
}

@end
