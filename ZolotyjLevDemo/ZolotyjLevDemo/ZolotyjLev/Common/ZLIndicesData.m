//
//  ZLIndicesData.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 31.01.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "ZLIndicesData.h"

@implementation ZLIndicesData

#pragma mark - Ctors/Dtor
-(ZLIndicesData *)initWithLength:(GLuint)length
{
    self = [super init];
    if (self)
    {
        mLength = length;
        mSize = sizeof(GLuint) * mLength;
        mData = malloc(mSize);
        mCount = 0;
    }
    return self;
}

-(void)dealloc
{
    if (mData)
    {
        free(mData);
        mData = NULL;
    }
    
    [super dealloc];
}

#pragma mark - Public methods
-(void)addIndicesWithModelType:(ModelType)modelType FirstIndex:(GLuint *)firstIndex
{
    [ZLToolbox addModelIndicesWithType:modelType IndicesData:mData IndicesOffset:&mCount FirstIndex:firstIndex];
}

-(void)addIndex:(GLuint)index
{
    if ([self full])
        return;
    
    mData[mCount] = index;
    mCount++;
}

-(void)setCount:(GLuint)count
{
    mCount = count;
}

-(GLuint *)data
{
    return mData;
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
