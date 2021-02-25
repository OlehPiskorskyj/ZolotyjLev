//
//  ZLIndicesData.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 31.01.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLToolbox.h"

@interface ZLIndicesData : NSObject
{
@private GLuint *mData;
@private GLuint mLength;
@private GLuint mCount;
@private GLuint mSize;
}

-(ZLIndicesData *)initWithLength:(GLuint)length;
-(void)addIndicesWithModelType:(ModelType)modelType FirstIndex:(GLuint *)firstIndex;
-(void)addIndex:(GLuint)index;
-(void)setCount:(GLuint)count;
-(GLuint *)data;
-(GLuint)count;
-(GLuint)size;
-(BOOL)full;

@end
