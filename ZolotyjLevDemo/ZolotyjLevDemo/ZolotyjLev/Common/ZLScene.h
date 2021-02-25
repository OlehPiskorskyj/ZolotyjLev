//
//  ZLScene.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 29.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <GLKit/GLKit.h>

@class ZLNavigationController;

@protocol ZLSceneDelegate<NSObject>
@required
-(void)ZLSceneDelegateInitialize;
-(void)ZLSceneDelegateUpdateWithTimeElapsed:(float)timeElapsed;
-(void)ZLSceneDelegateDrawWithTimeElapsed:(float)timeElapsed;
@end

@interface ZLScene : GLKViewController<ZLSceneDelegate>
{
@private ZLNavigationController *mCustomNavigationController;
@protected EAGLContext *mContext;
@protected BOOL mIsRenderEnable;
@private NSDate *mPreviousTime;
@private UIView *mParentView;
}

-(UIView *)parentView;
-(void)presentInView:(UIView *)view;
-(void)renderEnable:(BOOL)enable;
-(void)dismiss;

@end
