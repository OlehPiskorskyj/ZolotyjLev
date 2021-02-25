//
//  MainScene.h
//  ZolotyjLevDemo
//
//  Created by Oleh Piskorskyj on 15.06.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "ZLScene.h"
#import "ZolotyjLev.h"
#import "GamePad.h"

@class BrickRenderer;

@interface MainScene : ZLScene
{
@private BrickRenderer *mBrickRenderer;
@private ZLLight *mLight;
@private GamePad *mGamePad;
@private float mPositionY;
@private float mYawAngle;
@private float mPitchAngle;
    
@private NSMutableArray *mBricks;
}

@end
