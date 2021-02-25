//
//  ZLScene.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 29.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLScene.h"
#import "ZLNavigationController.h"
#import "ZLToolbox.h"

@implementation ZLScene

#pragma mark - Ctors/Dtor
-(void)dealloc
{
    if (mCustomNavigationController) [mCustomNavigationController release];
    if (mContext) [mContext release];
    [super dealloc];
}

#pragma mark - ViewController life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setPreferredFramesPerSecond:60];
    
    mIsRenderEnable = TRUE;
    
    mContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    GLKView *view = (GLKView *)[self view];
    [view setContext:mContext];
    [view setDrawableColorFormat:GLKViewDrawableColorFormatRGBA8888];
    [view setDrawableDepthFormat:GLKViewDrawableDepthFormat16];
    [view setDrawableMultisample:GLKViewDrawableMultisample4X];
    [EAGLContext setCurrentContext:mContext];
    
    glViewport(0.0f, 0.0f, view.bounds.size.width, view.bounds.size.height);
    
    [self updatePreviousTime];
    [self ZLSceneDelegateInitialize];
}

#pragma mark - TDViewControllerDelegate
-(void)ZLSceneDelegateInitialize
{}

-(void)ZLSceneDelegateUpdateWithTimeElapsed:(float)timeElapsed
{}

-(void)ZLSceneDelegateDrawWithTimeElapsed:(float)timeElapsed
{}

#pragma mark - GLKViewDelegate
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self ZLSceneDelegateUpdateWithTimeElapsed:[self elapsedTime]];
    
    if (mIsRenderEnable)
    {
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        [self ZLSceneDelegateDrawWithTimeElapsed:[self elapsedTime]];
    }
    
    [self updatePreviousTime];
}

#pragma mark - Public Methods
-(UIView *)parentView
{
    return mParentView;
}

-(void)presentInView:(UIView *)view
{
    mParentView = view;
    
    ZLNavigationController *navigationController = [[ZLNavigationController alloc] init];
    [self setCustomNavigationController:navigationController];
    [view addSubview:[navigationController view]];
    [navigationController release];
    
    [ZLToolbox addConstraints2View:[navigationController view] ParentView:view ConstraintsTemplate:ConstraintsTemplate_LEFT_RIGHT_TOP_BOTTOM];
    [navigationController pushViewController:self animated:FALSE];
    [self release];
}

-(void)renderEnable:(BOOL)enable
{
    mIsRenderEnable = enable;
}

-(void)dismiss
{
    if (mCustomNavigationController)
    {
        [mCustomNavigationController popViewControllerAnimated:FALSE];
        [self setCustomNavigationController:NULL];
    }
}

#pragma mark - Other methods
-(void)updatePreviousTime
{
    if (mPreviousTime)
        [mPreviousTime release];
    
    mPreviousTime = [[NSDate alloc] init];
}

-(double)elapsedTime
{
    return ABS([mPreviousTime timeIntervalSinceNow]);
}

-(void)setCustomNavigationController:(ZLNavigationController *)navigationController
{
    if (mCustomNavigationController != navigationController)
    {
        if (mCustomNavigationController)
            [mCustomNavigationController release];
        [navigationController retain];
        mCustomNavigationController = navigationController;
    }
}

@end

/*
 -(void)draw
 {
 [self ZLSceneDelegateUpdateWithTimeElapsed:[self elapsedTime]];
 }
 
 -(void)startGameLoop
 {
 CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(draw)];
 [displayLink setFrameInterval:1];      // 1=60 fps, 2=30 fps
 [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
 }
 */
