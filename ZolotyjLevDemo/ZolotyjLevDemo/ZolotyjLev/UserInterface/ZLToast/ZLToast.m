//
//  ZLToast.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 21.08.13.
//  Copyright (c) 2013 MetallicRain. All rights reserved.
//

#import "ZLToast.h"
#import "ZLToastManager.h"
#import "ZLToolbox.h"
#import "ZLViewController.h"

#ifndef ZLToast_CONSTS
#define ZLToast_CONSTS

#define ZLToast_MAIN_WIDTH                              270.0f
#define ZLToast_MAIN_HEIGHT                             85.0f
#define ZLToast_TITLE_WIDTH                             250.0f
#define ZLToast_TITLE_HEIGHT                            34.0f
#define ZLToast_TITLE_PADDING                           10.0f
#define ZLToast_CORNER_RADIUS                           4.0f

#endif

@implementation ZLToast

#pragma mark - Ctors/Dtor
-(ZLToast *)initWithMessage:(NSString *)message Title:(NSString *)title Duration:(ZLToastDuration)duration
{
    self = [super init];
    if (self)
    {
        ZLToast *toast = [[ZLToastManager instance] toast];
        if (!toast)
        {
            mTitle = title;
            mDuration = (float)duration;
            mIsHidden = TRUE;
            mIsDead = FALSE;
            
            mMessage = [[NSMutableString alloc] init];
            [mMessage appendString:message];
            
            mWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            mViewController = [[ZLViewController alloc] init];
            [mWindow setRootViewController:mViewController];
            [mWindow setTag:ZL_CONSTS_ALERT_WINDOW_TEG];
            
            //[self createBackground];
            [self createMainView];
            if (mTitle) [self createTitleView];
            [self createMessageView];
            [self createTouchInterceptor];
            
            [[ZLToastManager instance] setToast:self];
        }
        else
        {
            mIsDead = TRUE;
            [toast addMessage:message];
        }
    }
    return self;
}

-(ZLToast *)initWithMessage:(NSString *)message Duration:(ZLToastDuration)duration
{
    return [self initWithMessage:message Title:NULL Duration:duration];
}

-(ZLToast *)initWithMessage:(NSString *)message
{
    return [self initWithMessage:message Title:NULL Duration:ZLToastDuration_LONG];
}

-(void)dealloc
{
    if (mMessage) [mMessage release];
    [super dealloc];
}

#pragma mark - Public methods
-(void)addMessage:(NSString *)message
{
    mOvertime += mDuration;
    [mMessage appendFormat:@"\n%@", message];
    [mViewMessage setTitle:NULL forState:UIControlStateNormal];
    [mViewMessage setTitle:mMessage forState:UIControlStateNormal];
    [self updateViewMessage];
}

-(void)show
{
    if (mIsDead)
        [[ZLToastManager instance] destroyToast:self];
    else
    {
        [mWindow setWindowLevel:[ZLToolbox topWindowLevel]];
        [mWindow makeKeyAndVisible];
        
        CGAffineTransform transform = mMainWrapper.transform;
        [mMainWrapper setAlpha:0.0f];
        [mMainWrapper setTransform:CGAffineTransformScale(transform, 0.5f, 0.5f)];
        
        [UIView animateWithDuration:0.2f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [mMainWrapper setAlpha:1.0f];
            [mMainWrapper setTransform:CGAffineTransformScale(transform, 1.1f, 1.1f)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.08f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [mMainWrapper setTransform:CGAffineTransformScale(transform, 1.0f, 1.0f)];
            } completion:^(BOOL finished) {
                mIsHidden = FALSE;
                [self hideAfter:mDuration];
            }];
        }];
    }
}

-(void)hideAfter:(float)time
{
    dispatch_time_t sleepTime = dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC);
    dispatch_after(sleepTime, dispatch_get_main_queue(), ^(void) {
        if (mOvertime > 0)
        {
            [self hideAfter:mOvertime];
            mOvertime -= mDuration;
        }
        else
        {
            [self hide];
            [self release];
        }
    });
}

-(void)hide
{
    if (!mIsHidden)
    {
        mIsHidden = TRUE;
        [[ZLToastManager instance] setToast:NULL];
        
        if ([ZLToolbox deviceType] == DeviceType_IPAD)
            [[NSNotificationCenter defaultCenter] removeObserver:self];
        
        [UIView animateWithDuration:0.1f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [mWindow setAlpha:0.0f];
        } completion:^(BOOL finished) {
            //[mWindow resignKeyWindow];
            [mWindow release];
            [[[UIApplication sharedApplication].delegate window] makeKeyAndVisible];
        }];
    }
}

-(NSString *)message
{
    return mMessage;
}

#pragma mark - Private methods
-(void)createBackground
{
    UIView *viewBackground = [[UIView alloc] init];
    [viewBackground setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [viewBackground setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.5f]];
    [[mViewController view] addSubview:viewBackground];
    [viewBackground release];
    
    [ZLToolbox addConstraints2View:viewBackground ParentView:[mViewController view] ConstraintsTemplate:ConstraintsTemplate_LEFT_RIGHT_TOP_BOTTOM];
}

-(void)createMainView
{
    mMainWrapper = [[UIView alloc] init];
    [mMainWrapper setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [mMainWrapper setBackgroundColor:[UIColor colorWithWhite:237.0f / 255.0f alpha:1.0f]];
    [mMainWrapper.layer setCornerRadius:ZLToast_CORNER_RADIUS];
    [mMainWrapper.layer setMasksToBounds:TRUE];
    [[mViewController view] addSubview:mMainWrapper];
    [mMainWrapper release];
    
    NSArray *constraints = [ZLToolbox addConstraints2View:mMainWrapper ParentView:[mViewController view] ConstraintsTemplate:ConstraintsTemplate_CENTER_X_CENTER_Y_WIDTH_HEIGHT Value1:0.0f Value2:0.0f Value3:ZLToast_MAIN_WIDTH Value4:ZLToast_MAIN_HEIGHT ReturnConstraints:TRUE];
    mCtrMainWrapperHeight = [constraints lastObject];
    [constraints release];
}

-(void)createTitleView
{
    mTitleView = [[UILabel alloc] init];
    [mTitleView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [mTitleView setBackgroundColor:[UIColor clearColor]];
    [mTitleView setTextAlignment:NSTextAlignmentCenter];
    [mTitleView setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0f]];
    [mTitleView setText:mTitle];
    [mMainWrapper addSubview:mTitleView];
    [mTitleView release];
    
    [ZLToolbox addConstraints2View:mTitleView ParentView:mMainWrapper ConstraintsTemplate:ConstraintsTemplate_LEFT_RIGHT_TOP_HEIGHT Value1:ZLToast_TITLE_PADDING Value2:-ZLToast_TITLE_PADDING Value3:ZLToast_TITLE_PADDING Value4:ZLToast_TITLE_HEIGHT];
}

-(void)createMessageView
{
    mViewMessage = [[UIButton alloc] init];
    [mViewMessage setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [mViewMessage setBackgroundColor:[UIColor clearColor]];
    [mViewMessage.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [mViewMessage.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [mViewMessage.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f]];
    [mViewMessage.titleLabel setAdjustsFontSizeToFitWidth:TRUE];
    [mViewMessage.titleLabel setMinimumScaleFactor:40.0f];
    [mViewMessage setContentEdgeInsets:UIEdgeInsetsMake(0.0f, 10.0f, 0.0f, 10.0f)];
    [mViewMessage setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mViewMessage setTitle:mMessage forState:UIControlStateNormal];
    [mViewMessage setClipsToBounds:TRUE];
    [mViewMessage sizeToFit];
    [mMainWrapper addSubview:mViewMessage];
    [mViewMessage release];
    
    NSArray *constraints = [ZLToolbox addConstraints2View:mViewMessage ParentView:mMainWrapper ConstraintsTemplate:ConstraintsTemplate_LEFT_RIGHT_TOP_HEIGHT Value1:0.0f Value2:0.0f Value3:0.0f Value4:0.0f ReturnConstraints:TRUE];
    mCtrViewMessageTop = [constraints objectAtIndex:2];
    mCtrViewMessageHeight = [constraints lastObject];
    [constraints release];
    
    [self updateViewMessage];
}

-(void)updateViewMessage
{
    float titleHeight = mTitleView ? ZLToast_TITLE_PADDING + ZLToast_TITLE_HEIGHT : 0.0f;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:mViewMessage.titleLabel.font, NSFontAttributeName, paragraphStyle, NSParagraphStyleAttributeName, NULL];
    CGSize textSize = [mMessage boundingRectWithSize:CGSizeMake(ZLToast_MAIN_WIDTH - 10.0f, 20000.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:NULL].size;
    CGSize adjustedTextSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    float messageHeight = adjustedTextSize.height + 18.0f;
    [paragraphStyle release];
    
    float totalContentHeight = titleHeight + messageHeight + 10.0f;
    if (totalContentHeight < ZLToast_MAIN_HEIGHT)
    {
        [mCtrViewMessageTop setConstant:titleHeight];
        [mCtrViewMessageHeight setConstant:ZLToast_MAIN_HEIGHT - titleHeight];
    }
    else
    {
        [mCtrViewMessageTop setConstant:titleHeight];
        [mCtrViewMessageHeight setConstant:totalContentHeight - titleHeight];
        [mCtrMainWrapperHeight setConstant:totalContentHeight];
    }
}

-(void)createTouchInterceptor
{
    mTouchInterceptor = [[UIView alloc] init];
    [mTouchInterceptor setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [mTouchInterceptor setBackgroundColor:[UIColor clearColor]];
    [mTouchInterceptor setUserInteractionEnabled:TRUE];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [tapGestureRecognizer setNumberOfTapsRequired:1];
    [tapGestureRecognizer setNumberOfTouchesRequired:1];
    [mTouchInterceptor addGestureRecognizer:tapGestureRecognizer];
    [tapGestureRecognizer release];
    
    [[mViewController view] addSubview:mTouchInterceptor];
    [mTouchInterceptor release];
    
    [ZLToolbox addConstraints2View:mTouchInterceptor ParentView:[mViewController view] ConstraintsTemplate:ConstraintsTemplate_LEFT_RIGHT_TOP_BOTTOM];
}

-(void)tap
{
    [self hide];
}

@end
