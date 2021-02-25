//
//  ZLVerticesData.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 31.01.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "ZLVerticesData.h"

@implementation ZLVerticesData

#pragma mark - Ctors/Dtor
-(ZLVerticesData *)initWithType:(ZLVerticesDataType)type Length:(GLuint)length
{
    self = [super init];
    if (self)
    {
        mType = type;
        mLength = length;
        
        if (mType == ZLVerticesDataType_COMMON)
        {
            mVertexSize = sizeof(Vertex);
            mSize = mVertexSize * mLength;
            mDataCommon = malloc(mSize);
        }
        else
        {
            mVertexSize = sizeof(VertexLight);
            mSize = mVertexSize * mLength;
            mDataLight = malloc(mSize);
        }
        
        mCount = 0;
    }
    return self;
}

-(void)dealloc
{
    if (mDataCommon)
    {
        free(mDataCommon);
        mDataCommon = NULL;
    }
    
    if (mDataLight)
    {
        free(mDataLight);
        mDataLight = NULL;
    }
    
    [super dealloc];
}

#pragma mark - Public methods
-(void)addVertex:(void *)vertex
{
    if ([self full])
        return;
    
    if (mType == ZLVerticesDataType_COMMON)
        mDataCommon[mCount] = *((Vertex *)vertex);
    else
        mDataLight[mCount] = *((VertexLight *)vertex);
    
    mCount++;
}

-(void)setCount:(GLuint)count
{
    mCount = count;
}

-(void *)data
{
    if (mType == ZLVerticesDataType_COMMON)
        return mDataCommon;
    else
        return mDataLight;
}

-(GLuint)count
{
    return mCount;
}

-(GLuint)size
{
    return mSize;
}

-(BOOL)full
{
    return mCount >= mLength;
}

@end
