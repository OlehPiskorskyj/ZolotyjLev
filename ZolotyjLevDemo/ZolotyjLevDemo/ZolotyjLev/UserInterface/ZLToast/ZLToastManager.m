//
//  ZLToastManager.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 7/30/15.
//  Copyright (c) 2015 MetallicRain. All rights reserved.
//

#import "ZLToastManager.h"
#import "ZLToast.h"

@implementation ZLToastManager

#pragma mark - Singleton
static ZLToastManager *sharedSingleton;
+(ZLToastManager *)instance
{
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[ZLToastManager alloc] init];
        return sharedSingleton;
    }
}

+(void)destroy
{
    if (sharedSingleton)
    {
        [sharedSingleton release];
        sharedSingleton = NULL;
    }
}

-(id)init
{
    self = [super init];
    return self;
}

-(void)dealloc
{
    if (mToast) [mToast release];
    [super dealloc];
}

#pragma mark - Public methods
-(ZLToast *)toast
{
    return mToast;
}

-(void)setToast:(ZLToast *)toast
{
    if (toast != mToast)
    {
        if (mToast)
            [mToast release];
        [toast retain];
        mToast = toast;
    }
}

-(void)destroyToast:(ZLToast *)toast
{
    [toast release];
}

#pragma mark - Other methods


@end
