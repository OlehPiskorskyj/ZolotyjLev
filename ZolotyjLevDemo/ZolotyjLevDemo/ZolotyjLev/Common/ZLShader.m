//
//  ZLShaderProgram.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 18.05.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLShader.h"
#import "ZLToolbox.h"

@implementation ZLShader

#pragma mark - Ctors/Dtor
-(ZLShader *)init
{
    self = [super init];
    if (self) [self internalInit];
    return self;
}

-(void)internalInit
{
}

-(void)dealloc
{
    if (mVertexShaderName) [mVertexShaderName release];
    if (mFragmantShaderName) [mFragmantShaderName release];
    [super dealloc];
}

#pragma mark - Public methods
-(void)setVertexShaderName:(NSString *)vertexShaderName
{
    if (mVertexShaderName != vertexShaderName)
    {
        if (mVertexShaderName)
            [mVertexShaderName release];
        [vertexShaderName retain];
        mVertexShaderName = vertexShaderName;
    }
}

-(void)setFragmantShaderName:(NSString *)fragmantShaderName
{
    if (mFragmantShaderName != fragmantShaderName)
    {
        if (mFragmantShaderName)
            [mFragmantShaderName release];
        [fragmantShaderName retain];
        mFragmantShaderName = fragmantShaderName;
    }
}

-(GLuint)attributeWithNameNSString:(NSString *)name
{
    return [self attributeWithName:[name UTF8String]];
}

-(GLuint)uniformWithNameNSString:(NSString *)name
{
    return [self uniformWithName:[name UTF8String]];
}

-(GLuint)attributeWithName:(const GLchar *)name
{
    return glGetAttribLocation(mProgramHandler, name);
}

-(GLuint)uniformWithName:(const GLchar *)name
{
    return glGetUniformLocation(mProgramHandler, name);
}

-(GLuint)handler
{
    return mProgramHandler;
}

-(void)compile
{
    GLuint vertexShader = [ZLShader compileShaderWithName:mVertexShaderName Type:GL_VERTEX_SHADER];
    GLuint fragmentShader = [ZLShader compileShaderWithName:mFragmantShaderName Type:GL_FRAGMENT_SHADER];
    
    mProgramHandler = glCreateProgram();
    glAttachShader(mProgramHandler, vertexShader);
    glAttachShader(mProgramHandler, fragmentShader);
    glLinkProgram(mProgramHandler);
    [ZLShader checkShaderErrorWithHandler:mProgramHandler];
    
    glDetachShader(mProgramHandler, vertexShader);
    glDeleteShader(vertexShader);
    
    glDetachShader(mProgramHandler, fragmentShader);
    glDeleteShader(fragmentShader);
}

#pragma mark - Static methods
+(GLuint)compileShaderWithName:(NSString *)name Type:(GLenum)type
{
    NSString *shaderPath = [[NSBundle mainBundle] pathForResource:name ofType:@"glsl"];
    NSError *error;
    NSString *shaderString = [NSString stringWithContentsOfFile:shaderPath encoding:NSUTF8StringEncoding error:&error];
    if (!shaderString)
    {
        NSLog(@"Error loading shader(%@): %@", name, [error localizedDescription]);
        exit(1);
    }
    
    GLuint shaderHandle = glCreateShader(type);
    const char *shaderStringUTF8 = [shaderString UTF8String];
    int shaderStringLength = (int)[shaderString length];
    glShaderSource(shaderHandle, 1, &shaderStringUTF8, &shaderStringLength);
    glCompileShader(shaderHandle);
    
    GLint success;
    glGetShaderiv(shaderHandle, GL_COMPILE_STATUS, &success);
    if (success == GL_FALSE)
    {
        GLchar messages[256];
        glGetShaderInfoLog(shaderHandle, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }
    
    return shaderHandle;
}

+(void)checkShaderErrorWithHandler:(GLuint)shaderHandle
{
    GLint success;
    glGetProgramiv(shaderHandle, GL_LINK_STATUS, &success);
    if (success == GL_FALSE)
    {
        GLchar messages[256];
        glGetProgramInfoLog(shaderHandle, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }
}

@end
