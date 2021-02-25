//
//  TDGamePad.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 31.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLButton.h"

typedef enum
{
    ZLGamePadEventType_NONE = -1,
    ZLGamePadEventType_MOVE_FORWARD = 0,
    ZLGamePadEventType_MOVE_BACKWARD = 180,
    ZLGamePadEventType_MOVE_LEFT = 270,
    ZLGamePadEventType_MOVE_RIGHT = 90,
    ZLGamePadEventType_ACTION = 100,
    ZLGamePadEventType_ACTION_A = 101,
    ZLGamePadEventType_ACTION_B = 102,
    ZLGamePadEventType_ACTION_C = 103,
    ZLGamePadEventType_ACTION_D = 104
} ZLGamePadEventType;

@protocol ZLGamePadDelegate<NSObject>
-(void)ZLGamePadDelegateActionEvent:(ZLGamePadEventType)event;
-(void)ZLGamePadDelegateLookWithVelocityX:(float)velocityX VelocityY:(float)velocityY;
@end

@interface ZLGamePad : UIView
{
@private UIView *mViewParent;
@private UIView *mViewTouchPad;
@private UIView *mViewCenterDot;
@private ZLButton *mBtnUp;
@private ZLButton *mBtnDown;
@private ZLButton *mBtnRight;
@private ZLButton *mBtnLeft;
@private ZLButton *mBtnAction;
@private UIColor *mBaseColor;
@private ZLGamePadEventType mCurrentEvent;
@protected id<ZLGamePadDelegate> mDelegate;
@private float mButtonCustomImagePadding;
@private float mButtonImagePadding;
@private float mButtonSize;
    
@private UIPanGestureRecognizer *mPanGestureRecogniser;
}

-(ZLGamePad *)initWithParentView:(UIView *)view;
-(ZLGamePadEventType)currentEvent;
-(void)setBaseColor:(UIColor *)color;
-(void)setDelegate:(id)delegate;
+(BOOL)isMovingEvent:(ZLGamePadEventType)event;
-(void)calculateSizes;

@end
