//
//  ZLObject.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 30.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "ZolotyjLev.h"

@interface ZLObject : NSObject
{
@private int mTextureIndex;
    
@protected float mPositionX;
@protected float mPositionY;
@protected float mPositionZ;
@protected float mScaleX;
@protected float mScaleY;
@protected float mScaleZ;
@protected float mRotationX;
@protected float mRotationY;
@protected float mRotationZ;
@protected float mRotationAngle;
@protected float mIntersectionTargetRadius;
@protected float mIntersectionTargetCenterDeltaX;
@protected float mIntersectionTargetCenterDeltaY;
@protected float mIntersectionTargetCenterDeltaZ;
@protected float mWidth;
@protected float mHeight;
@protected float mAlpha;
@protected float mTextureDeltaX;
@protected float mTextureDeltaY;
@protected float mTextureOffsetX;
@protected float mTextureOffsetY;
    
@protected GLKVector3 mNormal;
    
@protected ZLVerticesData *mVertices;
@protected ZLIndicesData *mIndices;
    
@private ZLTexture *mTexture;
}

-(void)initialize;
-(void)updateWithTimeElapsed:(float)timeElapsed;
-(void)drawWithLights:(NSArray *)lights;
-(void)drawWithLight:(ZLLight *)light;
-(void)draw;

-(void)setPositionX:(float)positionX;
-(void)setPositionY:(float)positionY;
-(void)setPositionZ:(float)positionZ;
-(void)setTotalScale:(float)scale;
-(void)setScaleX:(float)scaleX;
-(void)setScaleY:(float)scaleY;
-(void)setScaleZ:(float)scaleZ;

-(void)setAlpha:(float)alpha;

-(void)setTexture:(ZLTexture *)texture;
-(void)setTextureIndex:(int)textureIndex;

-(float)positionX;
-(float)positionY;
-(float)positionZ;
-(float)scaleX;
-(float)scaleY;
-(float)scaleZ;
-(float)rotationX;
-(float)rotationY;
-(float)rotationZ;
-(float)rotationAngle;

-(float)intersectionTargetRadius;
-(float)intersectionTargetCenterX;
-(float)intersectionTargetCenterY;
-(float)intersectionTargetCenterZ;

-(float)alpha;

-(float)textureOffsetX;
-(float)textureOffsetY;

-(GLKVector3 *)normal;

@end
