//
//  BrickRenderer.h
//  Czarocvit
//
//  Created by Oleh Piskorskyj on 01.12.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "ZLRenderer.h"

@class Brick;

@interface BrickRenderer : ZLRenderer
{
@protected Vertex *mVerticesData;
@protected GLuint mVerticesDataSize;
@protected GLuint mVerticesCount;
@protected GLuint *mIndicesData;
@protected GLuint mIndicesDataSize;
@protected GLuint mIndicesCount;
}

-(void)prepareToRender;
-(void)renderBrick:(Brick *)brick;

@end
