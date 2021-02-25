//
//  ZLTextureManager.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 08.06.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface ZLTextureManager : NSObject
{
@private NSMutableDictionary *mData;
}

+(ZLTextureManager *)instance;
-(void)addTextureID:(GLuint)textureID Key:(NSString *)key;
-(GLuint)textureWithKey:(NSString *)key;

@end
