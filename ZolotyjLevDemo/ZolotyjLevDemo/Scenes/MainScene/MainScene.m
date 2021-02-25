//
//  MainScene.m
//  ZolotyjLevDemo
//
//  Created by Oleh Piskorskyj on 15.06.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "MainScene.h"
#import "BrickRenderer.h"
#import "Brick.h"
#import "Consts.h"

@implementation MainScene

#pragma mark Ctors/Dtor
-(void)dealloc
{
    if (mLight) [mLight release];
    if (mGamePad) [mGamePad release];
    if (mBricks) [mBricks release];
    [super dealloc];
}

#pragma mark - ZLSceneDelegate
-(void)ZLSceneDelegateInitialize
{
    glClearColor(CONSTS_COLOR_FOG_LIGHT_RED, CONSTS_COLOR_FOG_LIGHT_GREEN, CONSTS_COLOR_FOG_LIGHT_BLUE, 1.0f);
    
    mPositionY = 20.0f;
    mYawAngle = CONSTS_START_PLAYER_YAW_ANGLE;
    mPitchAngle = CONSTS_START_PLAYER_PITCH_ANGLE;
    
    [[ZLCamera instance] setProjectionMatrix:GLKMatrix4MakePerspective(GLKMathDegreesToRadians(ZL_CONSTS_CAMERA_FIELD_OF_VIEW), fabs(self.view.frame.size.width / self.view.frame.size.height), ZL_CONSTS_CAMERA_NEAR_PLANE, ZL_CONSTS_CAMERA_FAR_PLANE_FAR)];
    [[ZLCamera instance] setPositionWithX:0.0f Y:mPositionY Z:0.0f];
    
    glEnable(GL_DEPTH_TEST);
    glDisable(GL_BLEND);
    
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glCullFace(GL_BACK);
    
    mLight = [[ZLLight alloc] init];
    [mLight setPositionX:0.0f Y:200.0f Z:0.0f];
    [mLight setColorR:1.0f G:1.0f B:1.0f];
    [mLight setIntensivity:1.4f];
    
    mBrickRenderer = [[BrickRenderer alloc] init];
    [mBrickRenderer setStaticLight:mLight];
    
    mBricks = [[NSMutableArray alloc] init];
    for (int z = 0; z < 32; z++)
    {
        for (int x = 0; x < 32; x++)
        {
            if ([ZLToolbox randomIntToMax:4])
            {
                float centerX = x * 16.0f - 344.0f;
                float centerZ = z * 16.0f - 344.0f;
                float y = [ZLToolbox randomIntWithMin:-40.0f Max:-18.0f];
                
                Brick *brick = [[Brick alloc] init];
                [brick setPositionX:centerX];
                [brick setPositionZ:centerZ];
                [brick setPositionY:y];
                [mBricks addObject:brick];
                [brick release];
            }
        }
    }
    
    mGamePad = [[GamePad alloc] initWithParentView:[self view]];
    [mGamePad setDelegate:self];
}

-(void)ZLSceneDelegateUpdateWithTimeElapsed:(float)timeElapsed
{
    ZLGamePadEventType event = [mGamePad currentEvent];
    if ([ZLGamePad isMovingEvent:event])
    {
        float distance = 0.8f;
        float direction = (float)event;
        
        float angle = [[ZLCamera instance] yawAngle] + GLKMathDegreesToRadians(direction);
        
        float x = [[ZLCamera instance] positionX] + cos(angle) * distance;
        float z = [[ZLCamera instance] positionZ] + sin(angle) * distance;
        float y = mPositionY;
        
        [[ZLCamera instance] setPositionWithX:x Y:y Z:z];
    }
}

-(void)ZLSceneDelegateDrawWithTimeElapsed:(float)timeElapsed
{
    [mBrickRenderer prepareToRender];
    for (Brick *brick in mBricks)
    {
        if ([ZLToolbox distanceBetweenPoint1x:[brick positionX] Point1z:[brick positionZ] Point2x:[[ZLCamera instance] positionX] Point2z:[[ZLCamera instance] positionZ]] < CONSTS_DISTANCE_VISIBLE)
            [mBrickRenderer renderBrick:brick];
    }
}

#pragma mark - ZLGamePadDelegate
-(void)ZLGamePadDelegateActionEvent:(ZLGamePadEventType)event
{
    if (event == ZLGamePadEventType_ACTION)
    {
        GLKVector3 direction = [[ZLCamera instance] raycast];
        
        Brick *object = NULL;
        float distance = CONSTS_DISTANCE_VISIBLE;
        
        for (Brick *brick in mBricks)
        {
            if ([ZLToolbox intersectRaySphereWithRayStartX:[[ZLCamera instance] position]->x RayStartY:[[ZLCamera instance] position]->y RayStartZ:[[ZLCamera instance] position]->z RayDirectionX:direction.x RayDirectionY:direction.y RayDirectionZ:direction.z SphereCenterX:[brick intersectionTargetCenterX] SphereCenterY:[brick intersectionTargetCenterY] SphereCenterZ:[brick intersectionTargetCenterZ] SphereRadius:[brick intersectionTargetRadius]])
            {
                float currentDistance = [ZLToolbox distanceBetweenPoint1x:[brick positionX] Point1z:[brick positionZ] Point2x:[[ZLCamera instance] positionX] Point2z:[[ZLCamera instance] positionZ]];
                if (currentDistance < distance)
                {
                    object = brick;
                    distance = currentDistance;
                }
            }
        }
        
        if (object) [object setTintColorIntensity:0.5f];
    }
}

-(void)ZLGamePadDelegateLookWithVelocityX:(float)velocityX VelocityY:(float)velocityY
{
    [self yawWithDelta:velocityX];
    [self pitchWithDelta:velocityY];
}

#pragma mark - Other methods
-(void)yawWithDelta:(double)delta
{
    mYawAngle = mYawAngle + delta / 6000.0;
    if (mYawAngle < 0.0f)
        mYawAngle += 2 * M_PI;
    if (mYawAngle > 2 * M_PI)
        mYawAngle -= 2 * M_PI;
    [[ZLCamera instance] setYawAngle:mYawAngle - CONSTS_START_PLAYER_YAW_ANGLE + CONSTS_CAMERA_INITIAL_YAW_ANGLE];
}

-(void)pitchWithDelta:(double)delta
{
    mPitchAngle = mPitchAngle + delta / 6000.0;
    if (mPitchAngle < GLKMathDegreesToRadians(20.0f))
        mPitchAngle = GLKMathDegreesToRadians(20.0f);
    if (mPitchAngle > GLKMathDegreesToRadians(160.0f))
        mPitchAngle = GLKMathDegreesToRadians(160.0f);
    [[ZLCamera instance] setPitchAngle:mPitchAngle - CONSTS_START_PLAYER_PITCH_ANGLE + CONSTS_CAMERA_INITIAL_PITCH_ANGLE];
}

@end
