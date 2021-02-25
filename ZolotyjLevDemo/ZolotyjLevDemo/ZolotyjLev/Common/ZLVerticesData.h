//
//  ZLVerticesData.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 31.01.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLToolbox.h"

typedef enum
{
    ZLVerticesDataType_COMMON,
    ZLVerticesDataType_LIGHT
} ZLVerticesDataType;

@interface ZLVerticesData : NSObject
{
@private ZLVerticesDataType mType;
@private GLuint mLength;
@private GLuint mVertexSize;
@private GLuint mCount;
@private GLuint mSize;
    
@private Vertex *mDataCommon;
@private VertexLight *mDataLight;
}

-(ZLVerticesData *)initWithType:(ZLVerticesDataType)type Length:(GLuint)length;
-(void)addVertex:(void *)vertex;
-(void)setCount:(GLuint)count;
-(void *)data;
-(GLuint)count;
-(GLuint)size;
-(BOOL)full;

@end
