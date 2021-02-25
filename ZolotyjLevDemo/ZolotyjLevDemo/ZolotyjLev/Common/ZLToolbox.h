//
//  ZLToolbox.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 18.05.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "ZLConsts.h"

typedef struct
{
    GLfloat Position[3];
    GLfloat Color[4];
    GLfloat TextureCoord[2];
    GLfloat Normal[3];
} Vertex;

typedef struct
{
    GLfloat Position[3];
    GLfloat TextureCoord[2];
    GLfloat Normal[3];
} VertexLight;

typedef enum
{
    ModelType_CUBE,
    ModelType_CUBE_SIMPLE,
    ModelType_PRISM,
    ModelType_PYRAMID,
    ModelType_SQUARE,
    ModelType_SQUARE_BACK
} ModelType;

typedef enum
{
    DeviceType_IPHONE,              // 750x1334
    DeviceType_IPHONE_PLUS,         // 1242x2208
    DeviceType_IPHONE_SE,           // 640x1136
    DeviceType_IPHONE_X,            // 1125x2436
    DeviceType_IPAD
} DeviceType;

typedef enum
{
    ConstraintsTemplate_LEFT_TOP_WIDTH_HEIGHT,
    ConstraintsTemplate_LEFT_BOTTOM_WIDTH_HEIGHT,
    ConstraintsTemplate_RIGHT_TOP_WIDTH_HEIGHT,
    ConstraintsTemplate_RIGHT_BOTTOM_WIDTH_HEIGHT,
    ConstraintsTemplate_LEFT_RIGHT_TOP_BOTTOM,
    ConstraintsTemplate_LEFT_RIGHT_TOP_HEIGHT,
    ConstraintsTemplate_LEFT_TOP_BOTTOM_WIDTH,
    ConstraintsTemplate_RIGHT_TOP_BOTTOM_WIDTH,
    ConstraintsTemplate_TOP_CENTER_X_WIDTH_HEIGHT,
    ConstraintsTemplate_LEFT_RIGHT_CENTER_Y_HEIGHT,
    ConstraintsTemplate_LEFT_RIGHT_CENTER_Y_HEIGHT_GORE,
    ConstraintsTemplate_LEFT_CENTER_Y_WIDTH_HEIGHT,
    ConstraintsTemplate_RIGHT_CENTER_Y_WIDTH_HEIGHT,
    ConstraintsTemplate_CENTER_X_CENTER_Y_WIDTH_HEIGHT
} ConstraintsTemplate;

@interface ZLToolbox : NSObject

#pragma mark - OpenGL geometry
+(void)addModelIndicesWithType:(ModelType)type IndicesData:(GLuint *)indicesData IndicesOffset:(GLuint *)indicesOffset FirstIndex:(GLuint *)firstIndex;

#pragma mark - OpenGL vertex array
+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot ColorSlot:(GLuint *)colorSlot TextureCoordSlot:(GLuint *)textureCoordSlot NormalSlot:(GLuint *)normalSlot;
+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot TextureCoordSlot:(GLuint *)textureCoordSlot NormalSlot:(GLuint *)normalSlot;
+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot ColorSlot:(GLuint *)colorSlot TextureCoordSlot:(GLuint *)textureCoordSlot;
+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot TextureCoordSlot:(GLuint *)textureCoordSlot;
+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot ColorSlot:(GLuint *)colorSlot;

#pragma mark - Math
+(int)randomIntToMax:(int)max;
+(int)randomIntWithMin:(int)min Max:(int)max;
+(BOOL)randomBoolWithPosto:(int)posto;
+(float)baryCentricWithP1:(GLKVector3)p1 P2:(GLKVector3)p2 P3:(GLKVector3)p3 Position:(GLKVector2)position;
+(float)distanceBetweenPoint1x:(float)p1x Point1z:(float)p1z Point2x:(float)p2x Point2z:(float)p2z;
+(float)roundFloat:(float)value SignsCount:(int)signsCount;
+(BOOL)isEqualFloat1:(float)float1 Float2:(float)float2 SignsCount:(int)signsCount;
+(BOOL)isEqualFloat1:(float)float1 Float2:(float)float2;
+(BOOL)intersectRaySphereWithRayStartX:(float)sx RayStartY:(float)sy RayStartZ:(float)sz RayDirectionX:(float)dx RayDirectionY:(float)dy RayDirectionZ:(float)dz SphereCenterX:(float)cx SphereCenterY:(float)cy SphereCenterZ:(float)cz SphereRadius:(float)r;
+(BOOL)intersectRayPlaneWithPlaneNormal:(GLKVector3 *)normal RayStart:(GLKVector3 *)start RayDirection:(GLKVector3 *)direction PlaneCenter:(GLKVector3)center Radius:(float)radius;

#pragma mark - UI
+(void)setTitle:(NSString *)title Button:(UIButton *)button;
+(void)setImage:(UIImage *)image Button:(UIButton *)button;
+(UIImage *)imageWithName:(NSString *)name;
+(UIImage *)grayscaleWithImage:(UIImage *)image;
+(void)setTiledImageWithName:(NSString *)name ImageView:(UIImageView *)view ScaleFactor:(float)scale;
+(void)runSpinAnimationWithView:(UIView *)view Duration:(CGFloat)duration Rotations:(CGFloat)rotations Repeats:(float)repeats;
+(void)updateCellBackgrond:(UITableViewCell *)cell;

#pragma mark - Constraints
+(NSArray *)addConstraints2View:(UIView *)view ParentView:(UIView *)parentView ConstraintsTemplate:(ConstraintsTemplate)constraintsTemplate;
+(NSArray *)addConstraints2View:(UIView *)view ParentView:(UIView *)parentView ConstraintsTemplate:(ConstraintsTemplate)constraintsTemplate Value1:(float)value1 Value2:(float)value2 Value3:(float)value3 Value4:(float)value4;
+(NSArray *)addConstraints2View:(UIView *)view ParentView:(UIView *)parentView ConstraintsTemplate:(ConstraintsTemplate)constraintsTemplate Value1:(float)value1 Value2:(float)value2 Value3:(float)value3 Value4:(float)value4 ReturnConstraints:(BOOL)returnConstraints;

#pragma mark - Common
+(UIWindowLevel)topWindowLevel;
+(NSString *)xibNameWithString:(NSString *)string;
+(DeviceType)deviceType;

#pragma mark - Localization
+(void)updateTextWithView:(UIView *)view Language:(NSString *)language;
+(NSString *)localizedStringWithKey:(NSString *)key Language:(NSString *)language;

#pragma mark - Other
+(id)safeGetObjectFromDictionary:(NSDictionary *)dictionary Key:(NSString *)key;

@end
