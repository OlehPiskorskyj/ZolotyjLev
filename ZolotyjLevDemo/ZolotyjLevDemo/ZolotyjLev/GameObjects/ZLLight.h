//
//  ZLLight.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 14.07.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLLight : NSObject
{
@private float mPositionX;
@private float mPositionY;
@private float mPositionZ;
    
@private float mColorR;
@private float mColorG;
@private float mColorB;

@private float mAttenuation1;
@private float mAttenuation2;
@private float mAttenuation3;
    
@private float mIntensivity;
}

-(ZLLight *)init;
-(void)setPositionX:(float)x Y:(float)y Z:(float)z;
-(void)setColorR:(float)r G:(float)g B:(float)b;
-(void)setAttenuation1:(float)a1 A2:(float)a2 A3:(float)a3;
-(void)setIntensivity:(float)intensivity;

-(float)positionX;
-(float)positionY;
-(float)positionZ;

-(float)colorR;
-(float)colorG;
-(float)colorB;

-(float)attenuation1;
-(float)attenuation2;
-(float)attenuation3;

-(float)intensivity;

@end
