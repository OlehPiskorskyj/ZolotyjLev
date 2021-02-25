//
//  ZLCamera.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 30.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface ZLCamera : NSObject
{    
@private float mYawAngle;
@private float mPitchAngle;
    
@private GLKMatrix4 mProjection;
@private GLKVector3 mPosition;
@private GLKVector3 mLookAt;
}

+(ZLCamera *)instance;
-(GLKMatrix4 *)projection;
-(GLKVector3 *)position;
-(GLKMatrix4)view;
-(GLKVector3)raycast;
-(void)setPositionWithX:(float)x Y:(float)y Z:(float)z;
-(float)positionX;
-(float)positionY;
-(float)positionZ;
-(void)setYawAngle:(float)angle;
-(void)setPitchAngle:(float)angle;
-(void)yawWithDelta:(double)delta;
-(void)pitchWithDelta:(double)delta;
-(float)yawAngle;
-(float)pitchAngle;
-(void)setProjectionMatrix:(GLKMatrix4)matrix;

@end
