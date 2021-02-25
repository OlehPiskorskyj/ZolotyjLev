//
//  TDGamePad.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 31.03.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLGamePad.h"
#import "ZLToolbox.h"

#ifndef ZLGamePad_CONSTS
#define ZLGamePad_CONSTS

#define ZLGamePad_BUTTON_PADDING                                2
#define ZLGamePad_BUTTON_BORDER                                 1
#define ZLGamePad_CENTER_DOT_SIZE                               2

#endif

@implementation ZLGamePad

#pragma mark - Ctors/Dctor
-(ZLGamePad *)initWithParentView:(UIView *)view
{
    self = [super init];
    if (self)
    {
        mViewParent = view;
        [mViewParent addSubview:self];
        [self internalInit];
    }
    return self;
}

-(void)internalInit
{
    [self calculateSizes];
    
    [self setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    mCurrentEvent = ZLGamePadEventType_NONE;
    
    mViewTouchPad = [[UIView alloc] init];
    [mViewTouchPad setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [mViewTouchPad setBackgroundColor:[UIColor clearColor]];
    [self addSubview:mViewTouchPad];
    [mViewTouchPad release];
    
    mPanGestureRecogniser = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [mPanGestureRecogniser setMaximumNumberOfTouches:1];
    [mPanGestureRecogniser setMinimumNumberOfTouches:1];
    [mViewTouchPad addGestureRecognizer:mPanGestureRecogniser];
    
    mViewCenterDot = [[UIView alloc] init];
    [mViewCenterDot setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [mViewCenterDot setFrame:CGRectMake(0.0f, 0.0f, ZLGamePad_CENTER_DOT_SIZE, ZLGamePad_CENTER_DOT_SIZE)];
    [mViewCenterDot setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:mViewCenterDot];
    [mViewCenterDot release];
    
    mBtnLeft = [self createButtonWithImageName:@"ico_arrow_left.png"];
    [self addSubview:mBtnLeft];
    [mBtnLeft release];
    
    mBtnDown = [self createButtonWithImageName:@"ico_arrow_down.png"];
    [self addSubview:mBtnDown];
    [mBtnDown release];
    
    mBtnRight = [self createButtonWithImageName:@"ico_arrow_right.png"];
    [self addSubview:mBtnRight];
    [mBtnRight release];
    
    mBtnUp = [self createButtonWithImageName:@"ico_arrow_up.png"];
    [self addSubview:mBtnUp];
    [mBtnUp release];
    
    mBtnAction = [self createButtonWithImageName:@"ico_action_active.png" Padding:mButtonCustomImagePadding];
    [self addSubview:mBtnAction];
    [mBtnAction release];
    
    [self createConstrains];
}

-(void)dealloc
{
    if (mPanGestureRecogniser) [mPanGestureRecogniser release];
    [super dealloc];
}

#pragma mark - Events
-(void)buttonTouchDown:(UIButton *)sender
{
    if (sender == mBtnAction)
    {
        if (mDelegate && [mDelegate respondsToSelector:@selector(ZLGamePadDelegateActionEvent:)])
            [mDelegate ZLGamePadDelegateActionEvent:ZLGamePadEventType_ACTION];
    }
    else
    {
        if (sender == mBtnUp)
            mCurrentEvent = ZLGamePadEventType_MOVE_FORWARD;
        else if (sender == mBtnDown)
            mCurrentEvent = ZLGamePadEventType_MOVE_BACKWARD;
        else if (sender == mBtnLeft)
            mCurrentEvent = ZLGamePadEventType_MOVE_LEFT;
        else if (sender == mBtnRight)
            mCurrentEvent = ZLGamePadEventType_MOVE_RIGHT;
    }
}

-(void)buttonTouchCancel:(UIButton *)sender
{
    if (sender != mBtnAction)
    {
        mCurrentEvent = ZLGamePadEventType_NONE;
    }
}

#pragma mark - Public methods
-(ZLGamePadEventType)currentEvent
{
    return mCurrentEvent;
}

-(void)setBaseColor:(UIColor *)color
{
    if (mBaseColor != color)
    {
        if (mBaseColor)
            [mBaseColor release];
        [color retain];
        mBaseColor = color;
        
        [mBtnLeft setHighlightedColor:mBaseColor];
        [mBtnLeft.layer setBorderColor:[mBaseColor CGColor]];
        [mBtnDown setHighlightedColor:mBaseColor];
        [mBtnDown.layer setBorderColor:[mBaseColor CGColor]];
        [mBtnRight setHighlightedColor:mBaseColor];
        [mBtnRight.layer setBorderColor:[mBaseColor CGColor]];
        [mBtnUp setHighlightedColor:mBaseColor];
        [mBtnUp.layer setBorderColor:[mBaseColor CGColor]];
        [mBtnAction setHighlightedColor:mBaseColor];
        [mBtnAction.layer setBorderColor:[mBaseColor CGColor]];
    }
}

-(void)setDelegate:(id)delegate
{
    mDelegate = delegate;
}

+(BOOL)isMovingEvent:(ZLGamePadEventType)event
{
    return event == ZLGamePadEventType_MOVE_FORWARD ||
    event == ZLGamePadEventType_MOVE_BACKWARD ||
    event == ZLGamePadEventType_MOVE_LEFT ||
    event == ZLGamePadEventType_MOVE_RIGHT;
}

-(void)calculateSizes
{
    DeviceType deviceType = [ZLToolbox deviceType];
    
    mButtonCustomImagePadding = 28.0f;
    mButtonImagePadding = 40.0f;
    mButtonSize = 94.0f;
    
    if (deviceType == DeviceType_IPHONE_SE)
    {
        mButtonCustomImagePadding = 24.0f;
        mButtonImagePadding = 34.0f;
        mButtonSize = 80.0f;
    }
    else if (deviceType == DeviceType_IPAD)
    {
        mButtonCustomImagePadding = 42.0f;
        mButtonImagePadding = 60.0f;
        mButtonSize = 140.0f;
    }
}

#pragma mark - Other methods
-(ZLButton *)createButtonWithImageName:(NSString *)imageName Padding:(float)padding
{
    ZLButton *button = [[ZLButton alloc] init];
    [button setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [button setFrame:CGRectMake(0.0f, 0.0f, mButtonSize, mButtonSize)];
    
    UIImage *image = [UIImage imageNamed:imageName];
    [ZLToolbox setImage:image Button:button];
    [button setImageEdgeInsets:UIEdgeInsetsMake(padding, padding, padding, padding)];
    [button setBackgroundColor:[UIColor clearColor]];
    [button.layer setBorderWidth:ZLGamePad_BUTTON_BORDER];
    if (mBaseColor)
    {
        [button setBackgroundColor:mBaseColor];
        [button.layer setBorderColor:[mBaseColor CGColor]];
    }
    else
        [button.layer setBorderColor:[[UIColor colorWithWhite:1.0f alpha:0.6f] CGColor]];
    [button addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(buttonTouchCancel:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    return button;
}

-(ZLButton *)createButtonWithImageName:(NSString *)imageName
{
    return [self createButtonWithImageName:imageName Padding:mButtonImagePadding];
}

-(ZLButton *)createButtonWithText:(NSString *)text
{
    ZLButton *button = [[ZLButton alloc] init];
    [button setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [button setFrame:CGRectMake(0.0f, 0.0f, mButtonSize, mButtonSize)];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitle:text forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [button.layer setBorderWidth:ZLGamePad_BUTTON_BORDER];
    if (mBaseColor)
    {
        [button setBackgroundColor:mBaseColor];
        [button.layer setBorderColor:[mBaseColor CGColor]];
    }
    else
        [button.layer setBorderColor:[[UIColor colorWithWhite:1.0f alpha:0.6f] CGColor]];
    [button addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(buttonTouchCancel:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    return button;
}

-(void)createConstrains
{
    [ZLToolbox addConstraints2View:self ParentView:mViewParent ConstraintsTemplate:ConstraintsTemplate_LEFT_RIGHT_TOP_BOTTOM];
    [ZLToolbox addConstraints2View:mViewTouchPad ParentView:self ConstraintsTemplate:ConstraintsTemplate_LEFT_RIGHT_TOP_BOTTOM];
    [ZLToolbox addConstraints2View:mViewCenterDot ParentView:self ConstraintsTemplate:ConstraintsTemplate_CENTER_X_CENTER_Y_WIDTH_HEIGHT Value1:0.0f Value2:0.0f Value3:ZLGamePad_CENTER_DOT_SIZE Value4:ZLGamePad_CENTER_DOT_SIZE];
    
    [ZLToolbox addConstraints2View:mBtnLeft ParentView:self ConstraintsTemplate:ConstraintsTemplate_LEFT_BOTTOM_WIDTH_HEIGHT Value1:ZLGamePad_BUTTON_PADDING Value2:-ZLGamePad_BUTTON_PADDING Value3:mButtonSize Value4:mButtonSize];
    [ZLToolbox addConstraints2View:mBtnDown ParentView:self ConstraintsTemplate:ConstraintsTemplate_LEFT_BOTTOM_WIDTH_HEIGHT Value1:3.0f * ZLGamePad_BUTTON_PADDING + mButtonSize Value2:-ZLGamePad_BUTTON_PADDING Value3:mButtonSize Value4:mButtonSize];
    [ZLToolbox addConstraints2View:mBtnRight ParentView:self ConstraintsTemplate:ConstraintsTemplate_LEFT_BOTTOM_WIDTH_HEIGHT Value1:5.0f * ZLGamePad_BUTTON_PADDING + 2.0f * mButtonSize Value2:-ZLGamePad_BUTTON_PADDING Value3:mButtonSize Value4:mButtonSize];
    [ZLToolbox addConstraints2View:mBtnUp ParentView:self ConstraintsTemplate:ConstraintsTemplate_LEFT_BOTTOM_WIDTH_HEIGHT Value1:3.0f * ZLGamePad_BUTTON_PADDING + mButtonSize Value2:-3.0f * ZLGamePad_BUTTON_PADDING - mButtonSize Value3:mButtonSize Value4:mButtonSize];
    
    [ZLToolbox addConstraints2View:mBtnAction ParentView:self ConstraintsTemplate:ConstraintsTemplate_RIGHT_BOTTOM_WIDTH_HEIGHT Value1:-ZLGamePad_BUTTON_PADDING Value2:-ZLGamePad_BUTTON_PADDING Value3:mButtonSize Value4:mButtonSize];
}

#pragma mark - UIPanGestureRecognizer
-(void)pan:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint velocity = [gestureRecognizer velocityInView:mViewTouchPad];
    //CGPoint location = [gestureRecognizer locationInView:mViewTouchPad];
    
    if (mDelegate && [mDelegate respondsToSelector:@selector(ZLGamePadDelegateLookWithVelocityX:VelocityY:)])
        [mDelegate ZLGamePadDelegateLookWithVelocityX:velocity.x VelocityY:velocity.y];
}

@end
