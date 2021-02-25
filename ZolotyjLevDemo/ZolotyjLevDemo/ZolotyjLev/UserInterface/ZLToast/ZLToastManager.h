//
//  ZLToastManager.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 7/30/15.
//  Copyright (c) 2015 MetallicRain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLToast;

@interface ZLToastManager : NSObject
{
@private ZLToast *mToast;
}

+(ZLToastManager *)instance;
+(void)destroy;

-(ZLToast *)toast;
-(void)setToast:(ZLToast *)toast;
-(void)destroyToast:(ZLToast *)toast;

@end
