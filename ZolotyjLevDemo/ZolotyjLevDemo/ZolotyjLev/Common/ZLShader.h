//
//  ZLShaderProgram.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 18.05.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface ZLShader : NSObject
{
@private NSString *mVertexShaderName;
@private NSString *mFragmantShaderName;
    
@private GLuint mProgramHandler;
}

-(ZLShader *)init;
-(void)setVertexShaderName:(NSString *)vertexShaderName;
-(void)setFragmantShaderName:(NSString *)fragmantShaderName;
-(GLuint)attributeWithNameNSString:(NSString *)name;
-(GLuint)uniformWithNameNSString:(NSString *)name;
-(GLuint)attributeWithName:(const GLchar *)name;
-(GLuint)uniformWithName:(const GLchar *)name;
-(GLuint)handler;
-(void)compile;

+(GLuint)compileShaderWithName:(NSString *)name Type:(GLenum)type;
+(void)checkShaderErrorWithHandler:(GLuint)shaderHandle;

@end
