//
//  ZLToast.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 24.04.13.
//  Copyright (c) 2013 MetallicRain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    ZLToastDuration_LONG = 3,
    ZLToastDuration_SHORT = 1
} ZLToastDuration;

@class ZLViewController;

@interface ZLToast : NSObject
{
@private UIWindow *mWindow;
@private ZLViewController *mViewController;
@private UIView *mMainWrapper;
@private UILabel *mTitleView;
@private UIButton *mViewMessage;
@private UIView *mTouchInterceptor;
    
@private NSLayoutConstraint *mCtrMainWrapperHeight;
@private NSLayoutConstraint *mCtrViewMessageTop;
@private NSLayoutConstraint *mCtrViewMessageHeight;
    
@private NSMutableString *mMessage;
@private NSString *mTitle;

@private float mDuration;
@private float mOvertime;
@private BOOL mIsDead;
@private BOOL mIsHidden;
}

-(ZLToast *)initWithMessage:(NSString *)message;
-(ZLToast *)initWithMessage:(NSString *)message Duration:(ZLToastDuration)duration;
-(ZLToast *)initWithMessage:(NSString *)message Title:(NSString *)title Duration:(ZLToastDuration)duration;

-(void)addMessage:(NSString *)message;
-(void)show;

-(NSString *)message;

@end
