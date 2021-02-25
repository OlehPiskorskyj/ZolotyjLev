//
//  ZLObject.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 30.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLObject.h"

@implementation ZLObject

#pragma mark - Ctors/Dtor
-(ZLObject *)init
{
    self = [super init];
    if (self)
    {
        mPositionX = 0.0f;
        mPositionY = 0.0f;
        mPositionZ = 0.0f;
        
        mScaleX = 1.0f;
        mScaleY = 1.0f;
        mScaleZ = 1.0f;
        
        mRotationX = 0.0f;
        mRotationY = 0.0f;
        mRotationZ = 0.0f;
        mRotationAngle = 0.0f;
        
        mIntersectionTargetRadius = 1.0f;
        mIntersectionTargetCenterDeltaX = 0.0f;
        mIntersectionTargetCenterDeltaY = 0.0f;
        mIntersectionTargetCenterDeltaZ = 0.0f;
        
        mWidth = 1.0f;
        mHeight = 1.0f;
        mAlpha = 1.0f;
        
        mTextureIndex = 0;
        mTextureOffsetX = 0.0f;
        mTextureOffsetY = 0.0f;
        
        [self initialize];
    }
    return self;
}

-(void)dealloc
{
    if (mVertices) [mVertices release];
    if (mIndices) [mIndices release];
    [super dealloc];
}

#pragma mark - Public methods
-(void)initialize
{
}

-(void)updateWithTimeElapsed:(float)timeElapsed
{
}

-(void)drawWithLights:(NSArray *)lights
{
}

-(void)drawWithLight:(ZLLight *)light
{
}

-(void)draw
{
}

-(void)setPositionX:(float)positionX
{
    mPositionX = positionX;
}

-(void)setPositionY:(float)positionY
{
    mPositionY = positionY;
}

-(void)setPositionZ:(float)positionZ
{
    mPositionZ = positionZ;
}

-(void)setTotalScale:(float)scale
{
    mScaleX = scale;
    mScaleY = scale;
    mScaleZ = scale;
}

-(void)setScaleX:(float)scaleX
{
    mScaleX = scaleX;
}

-(void)setScaleY:(float)scaleY
{
    mScaleY = scaleY;
}

-(void)setScaleZ:(float)scaleZ
{
    mScaleZ = scaleZ;
}

-(void)setAlpha:(float)alpha
{
    mAlpha = alpha;
}

-(void)setTexture:(ZLTexture *)texture
{
    if (mTexture != texture)
    {
        if (mTexture)
            [mTexture release];
        [texture retain];
        mTexture = texture;
    }
}

-(void)setTextureIndex:(int)textureIndex
{
    mTextureIndex = textureIndex;
    [self updateTextureOffsets];
}

-(float)positionX
{
    return mPositionX;
}

-(float)positionY
{
    return mPositionY;
}

-(float)positionZ
{
    return mPositionZ;
}

-(float)scaleX
{
    return mScaleX;
}

-(float)scaleY
{
    return mScaleY;
}

-(float)scaleZ
{
    return mScaleZ;
}

-(float)rotationX
{
    return mRotationX;
}

-(float)rotationY
{
    return mRotationY;
}

-(float)rotationZ
{
    return mRotationZ;
}

-(float)rotationAngle
{
    return mRotationAngle;
}

-(float)intersectionTargetRadius
{
    return mIntersectionTargetRadius;
}

-(float)intersectionTargetCenterX
{
    return mPositionX + mIntersectionTargetCenterDeltaX;
}

-(float)intersectionTargetCenterY
{
    return mPositionY + mIntersectionTargetCenterDeltaY;
}

-(float)intersectionTargetCenterZ
{
    return mPositionZ + mIntersectionTargetCenterDeltaZ;
}

-(float)alpha
{
    return mAlpha;
}

-(float)textureOffsetX
{
    return mTextureOffsetX;
}

-(float)textureOffsetY
{
    return mTextureOffsetY;
}

-(GLKVector3 *)normal
{
    return &mNormal;
}

#pragma mark - Other methods
-(void)updateTextureOffsets
{
    int row = mTextureIndex / [mTexture rowsCount];
    int column = mTextureIndex % [mTexture rowsCount];
    
    mTextureOffsetX = (float)column / (float)[mTexture rowsCount];
    mTextureOffsetY = (float)row / (float)[mTexture rowsCount];
}

@end
