//
//  ZLRenderer.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 09.06.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/glext.h>
#import "ZolotyjLev.h"

@class ZLObject;
@class ZLShader;
@class ZLTexture;
@class ZLTexturePack;

@interface ZLRenderer : NSObject
{
@protected float mSize;
    
@protected GLuint mVertexArray;
@protected GLuint mVertexBuffer;
@protected GLuint mIndexBuffer;
@protected GLuint mPositionSlot;
@protected GLuint mColorSlot;
@protected GLuint mTextureCoordSlot;
@protected GLuint mNormalSlot;
@protected GLuint mProjectionUniform;
@protected GLuint mLookAtUniform;
@protected GLuint mModelViewUniform;
@protected GLuint mLightPositionUniform;
@protected GLuint mLightColourUniform;
@protected GLuint mLightAttenuationUniform;
@protected GLuint mLightIntensityUniform;
@protected GLuint mMaterialShineDemper;
@protected GLuint mMaterialReflectivity;
@protected GLuint mFogColorUniform;
@protected GLuint mTintColorUniform;
@protected GLuint mTintColorIntensityUniform;
@protected GLuint mAlphaUniform;
@protected GLuint mTextureCoordOffsetUniform;
@protected GLuint mTextureRowsCountUniform;
    
@protected NSMutableArray *mLightsPositionsUniforms;
@protected NSMutableArray *mLightsColoursUniforms;
@protected NSMutableArray *mLightsAttenuationsUniforms;
@protected NSMutableArray *mLightsIntensitiesUniforms;
    
@protected ZLShader *mShader;
@protected NSArray *mStaticLights;
@protected ZLLight *mStaticLight;
@protected ZLTexture *mTexture;
@protected ZLTexturePack *mTexturePack;
}

-(void)initialize;
-(void)prepareToRender;
-(void)createVAOWithVerticesData:(void *)verticesData VerticesDataSize:(GLuint)verticesDataSize IndicesData:(GLuint *)indicesData IndicesDataSize:(GLuint)indicesDataSize;
-(void)createVAOWithVerticesData:(void *)verticesData VerticesDataSize:(GLuint)verticesDataSize;
-(void)createVAOWithVerticesData:(ZLVerticesData *)verticesData IndicesData:(ZLIndicesData *)indicesData;
-(void)updateVAOWithVerticesData:(ZLVerticesData *)verticesData IndicesData:(ZLIndicesData *)indicesData;
-(void)renderObject:(ZLObject *)object;
-(ZLTexture *)createTexureWithName:(NSString *)textureName;
-(void)loadLights:(NSArray *)lights;
-(void)loadLight:(ZLLight *)light;
-(void)setStaticLights:(NSArray *)lights;
-(void)setStaticLight:(ZLLight *)light;
-(void)setTexture:(ZLTexture *)texture;
-(void)setTexturePack:(ZLTexturePack *)texturePack;
-(NSArray *)staticLights;
-(ZLLight *)staticLight;
-(ZLTexture *)texture;
-(ZLTexturePack *)texturePack;

@end
