//
//  ZLTextureManager.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 08.06.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLTextureManager.h"
#import "ZLTexture.h"

@implementation ZLTextureManager

#pragma mark - Singleton/Ctors/Dtor
+(ZLTextureManager *)instance
{
    static ZLTextureManager *sharedSingleton;
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[ZLTextureManager alloc] init];
        
        return sharedSingleton;
    }
}

-(id)init
{
    self = [super init];
    if (self)
    {
        mData = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)dealloc
{
    if (mData) [mData release];
    [super dealloc];
}

#pragma mark - Public methods
-(void)addTextureID:(GLuint)textureID Key:(NSString *)key
{
    [mData setObject:[NSNumber numberWithUnsignedInt:textureID] forKey:key];
}

-(GLuint)textureWithKey:(NSString *)key
{
    return [[mData objectForKey:key] unsignedIntValue];
}

@end
