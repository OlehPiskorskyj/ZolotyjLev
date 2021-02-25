//
//  ZLToolbox.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 18.05.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#import "ZLToolbox.h"

@implementation ZLToolbox

#pragma mark - OpenGL geometry
+(void)addModelIndicesWithType:(ModelType)type IndicesData:(GLuint *)indicesData IndicesOffset:(GLuint *)indicesOffset FirstIndex:(GLuint *)firstIndex
{
    GLuint offset = 0;
    if (indicesOffset)
        offset = *(indicesOffset);
    
    GLuint index = 0;
    if (firstIndex)
        index = *(firstIndex);
    
    if (type == ModelType_CUBE)
    {
        indicesData[offset] = index;
        offset++;
        indicesData[offset] = index + 2;
        offset++;
        indicesData[offset] = index + 1;
        offset++;
        indicesData[offset] = index + 1;
        offset++;
        indicesData[offset] = index + 2;
        offset++;
        indicesData[offset] = index + 3;
        offset++;
        
        indicesData[offset] = index + 4;
        offset++;
        indicesData[offset] = index + 6;
        offset++;
        indicesData[offset] = index + 5;
        offset++;
        indicesData[offset] = index + 5;
        offset++;
        indicesData[offset] = index + 6;
        offset++;
        indicesData[offset] = index + 7;
        offset++;
        
        indicesData[offset] = index + 8;
        offset++;
        indicesData[offset] = index + 9;
        offset++;
        indicesData[offset] = index + 10;
        offset++;
        indicesData[offset] = index + 9;
        offset++;
        indicesData[offset] = index + 11;
        offset++;
        indicesData[offset] = index + 10;
        offset++;
        
        indicesData[offset] = index + 12;
        offset++;
        indicesData[offset] = index + 13;
        offset++;
        indicesData[offset] = index + 14;
        offset++;
        indicesData[offset] = index + 13;
        offset++;
        indicesData[offset] = index + 15;
        offset++;
        indicesData[offset] = index + 14;
        offset++;
        
        indicesData[offset] = index + 16;
        offset++;
        indicesData[offset] = index + 18;
        offset++;
        indicesData[offset] = index + 17;
        offset++;
        indicesData[offset] = index + 17;
        offset++;
        indicesData[offset] = index + 18;
        offset++;
        indicesData[offset] = index + 19;
        offset++;
        
        indicesData[offset] = index + 20;
        offset++;
        indicesData[offset] = index + 21;
        offset++;
        indicesData[offset] = index + 22;
        offset++;
        indicesData[offset] = index + 21;
        offset++;
        indicesData[offset] = index + 23;
        offset++;
        indicesData[offset] = index + 22;
        offset++;
        
        if (firstIndex)
            *firstIndex = index + 24;
    }
    else if (type == ModelType_CUBE_SIMPLE)
    {
        indicesData[offset] = index;
        offset++;
        indicesData[offset] = index + 2;
        offset++;
        indicesData[offset] = index + 1;
        offset++;
        indicesData[offset] = index + 1;
        offset++;
        indicesData[offset] = index + 2;
        offset++;
        indicesData[offset] = index + 3;
        offset++;
        
        indicesData[offset] = index + 4;
        offset++;
        indicesData[offset] = index + 6;
        offset++;
        indicesData[offset] = index + 5;
        offset++;
        indicesData[offset] = index + 5;
        offset++;
        indicesData[offset] = index + 6;
        offset++;
        indicesData[offset] = index + 7;
        offset++;
        
        indicesData[offset] = index + 8;
        offset++;
        indicesData[offset] = index + 9;
        offset++;
        indicesData[offset] = index + 10;
        offset++;
        indicesData[offset] = index + 9;
        offset++;
        indicesData[offset] = index + 11;
        offset++;
        indicesData[offset] = index + 10;
        offset++;
        
        indicesData[offset] = index + 12;
        offset++;
        indicesData[offset] = index + 13;
        offset++;
        indicesData[offset] = index + 14;
        offset++;
        indicesData[offset] = index + 13;
        offset++;
        indicesData[offset] = index + 15;
        offset++;
        indicesData[offset] = index + 14;
        offset++;
        
        if (firstIndex)
            *firstIndex = index + 16;
    }
    else if (type == ModelType_PRISM)
    {
        indicesData[offset] = index;
        offset++;
        indicesData[offset] = index + 2;
        offset++;
        indicesData[offset] = index + 1;
        offset++;
        
        indicesData[offset] = index + 3;
        offset++;
        indicesData[offset] = index + 4;
        offset++;
        indicesData[offset] = index + 5;
        offset++;
        
        indicesData[offset] = index + 6;
        offset++;
        indicesData[offset] = index + 8;
        offset++;
        indicesData[offset] = index + 7;
        offset++;
        indicesData[offset] = index + 7;
        offset++;
        indicesData[offset] = index + 8;
        offset++;
        indicesData[offset] = index + 9;
        offset++;
        
        indicesData[offset] = index + 10;
        offset++;
        indicesData[offset] = index + 11;
        offset++;
        indicesData[offset] = index + 12;
        offset++;
        indicesData[offset] = index + 11;
        offset++;
        indicesData[offset] = index + 13;
        offset++;
        indicesData[offset] = index + 12;
        offset++;
        
        if (firstIndex)
            *firstIndex = index + 14;
    }
    else if (type == ModelType_SQUARE)
    {
        indicesData[offset] = index;
        offset++;
        indicesData[offset] = index + 2;
        offset++;
        indicesData[offset] = index + 1;
        offset++;
        indicesData[offset] = index + 1;
        offset++;
        indicesData[offset] = index + 2;
        offset++;
        indicesData[offset] = index + 3;
        offset++;
        
        if (firstIndex)
            *firstIndex = index + 4;
    }
    else if (type == ModelType_SQUARE_BACK)
    {
        indicesData[offset] = index;
        offset++;
        indicesData[offset] = index + 1;
        offset++;
        indicesData[offset] = index + 2;
        offset++;
        indicesData[offset] = index + 2;
        offset++;
        indicesData[offset] = index + 1;
        offset++;
        indicesData[offset] = index + 3;
        offset++;
        
        if (firstIndex)
            *firstIndex = index + 4;
    }
    
    if (indicesOffset)
        *indicesOffset = offset;
}

#pragma mark - OpenGL vertex array
+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot ColorSlot:(GLuint *)colorSlot TextureCoordSlot:(GLuint *)textureCoordSlot NormalSlot:(GLuint *)normalSlot
{
    if (positionSlot)
    {
        glEnableVertexAttribArray(*positionSlot);
        glVertexAttribPointer(*positionSlot, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), 0);
    }
    
    if (colorSlot)
    {
        glEnableVertexAttribArray(*colorSlot);
        glVertexAttribPointer(*colorSlot, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), (char *)(sizeof(GLfloat) * 3));
    }
    
    if (textureCoordSlot)
    {
        glEnableVertexAttribArray(*textureCoordSlot);
        glVertexAttribPointer(*textureCoordSlot, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void *)(sizeof(GLfloat) * 3 + sizeof(GLfloat) * 4));
    }
    
    if (normalSlot)
    {
        glEnableVertexAttribArray(*normalSlot);
        glVertexAttribPointer(*normalSlot, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (void *)(sizeof(GLfloat) * 3 + sizeof(GLfloat) * 4 + sizeof(GLfloat) * 2));
    }
}

+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot TextureCoordSlot:(GLuint *)textureCoordSlot NormalSlot:(GLuint *)normalSlot
{
    [ZLToolbox add2VertexArrayPositionSlot:positionSlot ColorSlot:NULL TextureCoordSlot:textureCoordSlot NormalSlot:normalSlot];
}

+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot ColorSlot:(GLuint *)colorSlot TextureCoordSlot:(GLuint *)textureCoordSlot
{
    [ZLToolbox add2VertexArrayPositionSlot:positionSlot ColorSlot:colorSlot TextureCoordSlot:textureCoordSlot NormalSlot:NULL];
}

+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot TextureCoordSlot:(GLuint *)textureCoordSlot
{
    [ZLToolbox add2VertexArrayPositionSlot:positionSlot ColorSlot:NULL TextureCoordSlot:textureCoordSlot NormalSlot:NULL];
}

+(void)add2VertexArrayPositionSlot:(GLuint *)positionSlot ColorSlot:(GLuint *)colorSlot
{
    [ZLToolbox add2VertexArrayPositionSlot:positionSlot ColorSlot:colorSlot TextureCoordSlot:NULL NormalSlot:NULL];
}

#pragma mark - Math
+(int)randomIntToMax:(int)max
{
    return [ZLToolbox randomIntWithMin:0 Max:max];
}

+(int)randomIntWithMin:(int)min Max:(int)max
{
    return min + arc4random_uniform(max - min + 1);
}

+(BOOL)randomBoolWithPosto:(int)posto
{
    return arc4random_uniform(100) < posto;
}

+(float)baryCentricWithP1:(GLKVector3)p1 P2:(GLKVector3)p2 P3:(GLKVector3)p3 Position:(GLKVector2)position
{
    float det = (p2.z - p3.z) * (p1.x - p3.x) + (p3.x - p2.x) * (p1.z - p3.z);
    float t1 = ((p2.z - p3.z) * (position.x - p3.x) + (p3.x - p2.x) * (position.y - p3.z)) / det;
    float t2 = ((p3.z - p1.z) * (position.x - p3.x) + (p1.x - p3.x) * (position.y - p3.z)) / det;
    float t3 = 1.0f - t1 - t2;
    return t1 * p1.y + t2 * p2.y + t3 * p3.y;
}

+(float)distanceBetweenPoint1x:(float)p1x Point1z:(float)p1z Point2x:(float)p2x Point2z:(float)p2z
{
    float xDistance = (p2x - p1x);
    float zDistance = (p2z - p1z);
    return sqrt((xDistance * xDistance) + (zDistance * zDistance));;
}

+(float)roundFloat:(float)value SignsCount:(int)signsCount
{
    /*
    float returnValue = 0.0f;
    float coef = powf(10.0f, signsCount);
    int intValue = value * (int)coef;
    returnValue = intValue / coef;
    */
    
    NSString *stringFormat = [NSString stringWithFormat:@"%@%@", @"%.", [NSString stringWithFormat:@"%dlf", signsCount]];
    NSString *stringValue = [NSString stringWithFormat:stringFormat, value];
    
    return [stringValue floatValue];
}

+(BOOL)isEqualFloat1:(float)float1 Float2:(float)float2 SignsCount:(int)signsCount
{
    /*
    int coef = powf(10.0f, signsCount);
    return (int)(float1 * coef) == (int)(float2 * coef);
    */
    
    NSString *stringFormat = [NSString stringWithFormat:@"%@%@", @"%.", [NSString stringWithFormat:@"%dlf", signsCount]];
    return [[NSString stringWithFormat:stringFormat, float1] isEqualToString:[NSString stringWithFormat:stringFormat, float2]];
}

+(BOOL)isEqualFloat1:(float)float1 Float2:(float)float2
{
    return [self isEqualFloat1:float1 Float2:float2 SignsCount:7];
}

+(BOOL)intersectRaySphereWithRayStartX:(float)sx RayStartY:(float)sy RayStartZ:(float)sz RayDirectionX:(float)dx RayDirectionY:(float)dy RayDirectionZ:(float)dz SphereCenterX:(float)cx SphereCenterY:(float)cy SphereCenterZ:(float)cz SphereRadius:(float)r
{
    BOOL intersect = FALSE;
    
    float b = 2 * (dx * (sx - cx) + dy * (sy - cy) + dz * (sz - cz));
    float c = sx * sx - 2 * sx * cx + cx * cx + sy * sy - 2 * sy * cy + cy * cy + sz * sz - 2 * sz * cz + cz * cz - r * r;
    float d = b * b - 4 * c;
    
    if (d >= 0) // jakszczo dyskryminant dodatnij, abo rivnyj nuliu, todi promin' może peretynaty sferu
    {
        // rozviazky rivnianna je peretynamy sfery
        // dyskryminant rivnuj nuliu (x1 == x2) - promin' dotykajet'sia, tomu rozviazky budut' odnakovi
        // x2 < 0 - peretyn stavsia poza poczatkom promenia, tomu v takij sytuaciji vvażajemo szczo peretynu ne trapylos'
        
        float sqrtD = sqrt(d);
        //float x1 = (-b - sqrtD) / 2.0f;
        float x2 = (-b + sqrtD) / 2.0f;
        
        intersect = !(x2 < 0);
    }
    
    return intersect;
}

+(BOOL)intersectRayPlaneWithPlaneNormal:(GLKVector3 *)normal RayStart:(GLKVector3 *)start RayDirection:(GLKVector3 *)direction PlaneCenter:(GLKVector3)center Radius:(float)radius
{
    BOOL intersect = FALSE;
    
    float a = direction->x * normal->x + direction->y * normal->y + direction->z * normal->z;
    if (a != 0)
    {
        float t = (center.x * normal->x + center.y * normal->y + center.z * normal->z - normal->x * start->x - normal->y * start->y - normal->z * start->z) / a;
        if (t >= 0)
        {
            float x = start->x + t * direction->x;
            float y = start->y + t * direction->y;
            float z = start->z + t * direction->z;
            
            GLKVector3 intersectionPoint = GLKVector3Make(x, y, z);
            float distance = GLKVector3Length(GLKVector3Subtract(intersectionPoint, center));
            if (distance < radius)
            {
                intersect = TRUE;
            }
        }
    }
    
    return intersect;
}

#pragma mark - UI
+(void)setTitle:(NSString *)title Button:(UIButton *)button
{
    if (button)
    {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateHighlighted];
        [button setTitle:title forState:UIControlStateSelected];
        [button setTitle:title forState:UIControlStateDisabled];
    }
}

+(void)setImage:(UIImage *)image Button:(UIButton *)button
{
    if (button)
    {
        [button setImage:image forState:UIControlStateNormal];
        [button setImage:image forState:UIControlStateHighlighted];
        [button setImage:image forState:UIControlStateSelected];
        [button setImage:image forState:UIControlStateDisabled];
    }
}

+(UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = NULL;
    NSArray *nameComponents = [name componentsSeparatedByString:@"."];
    if ([nameComponents count] > 1)
    {
        image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[nameComponents firstObject] ofType:[nameComponents lastObject]]];
    }
    return image;
}

+(UIImage *)grayscaleWithImage:(UIImage *)image
{
    CIImage *ciImage = [[CIImage alloc] initWithImage:image];
    CIImage *ciGrayscale = [ciImage imageByApplyingFilter:@"CIColorControls" withInputParameters:@{kCIInputSaturationKey:@0.0}];
    UIImage *grayscaleImage = [UIImage imageWithCIImage:ciGrayscale];
    [ciImage release];
    return grayscaleImage;
}

+(void)setTiledImageWithName:(NSString *)name ImageView:(UIImageView *)view ScaleFactor:(float)scale
{
    UIImage *image = [ZLToolbox imageWithName:name];
    UIImage *tiledImage = [UIImage imageWithCGImage:[image CGImage] scale:scale orientation:image.imageOrientation];
    [view setBackgroundColor:[UIColor colorWithPatternImage:tiledImage]];
    [image release];
}

+(void)runSpinAnimationWithView:(UIView *)view Duration:(CGFloat)duration Rotations:(CGFloat)rotations Repeats:(float)repeats
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animation setToValue:[NSNumber numberWithFloat:-M_PI * 2.0 * rotations * duration]];
    [animation setDuration:duration];
    [animation setCumulative:TRUE];
    [animation setRepeatCount:repeats];
    [view.layer addAnimation:animation forKey:@"rotationAnimation"];
}

+(void)updateCellBackgrond:(UITableViewCell *)cell
{
    if (cell && [[[UIDevice currentDevice] systemVersion] intValue] < 10)
        [cell setBackgroundColor:[[cell contentView] backgroundColor]];
}

#pragma mark - Constraints
+(NSArray *)addConstraints2View:(UIView *)view ParentView:(UIView *)parentView ConstraintsTemplate:(ConstraintsTemplate)constraintsTemplate
{
    return [ZLToolbox addConstraints2View:view ParentView:parentView ConstraintsTemplate:constraintsTemplate Value1:0.0f Value2:0.0f Value3:0.0f Value4:0.0f];
}

+(NSArray *)addConstraints2View:(UIView *)view ParentView:(UIView *)parentView ConstraintsTemplate:(ConstraintsTemplate)constraintsTemplate Value1:(float)value1 Value2:(float)value2 Value3:(float)value3 Value4:(float)value4
{
    return [ZLToolbox addConstraints2View:view ParentView:parentView ConstraintsTemplate:constraintsTemplate Value1:value1 Value2:value2 Value3:value3 Value4:value4 ReturnConstraints:FALSE];
}

+(NSArray *)addConstraints2View:(UIView *)view ParentView:(UIView *)parentView ConstraintsTemplate:(ConstraintsTemplate)constraintsTemplate Value1:(float)value1 Value2:(float)value2 Value3:(float)value3 Value4:(float)value4 ReturnConstraints:(BOOL)returnConstraints
{
    NSMutableArray *constraints = NULL;
    NSLayoutConstraint *constraint1 = NULL;
    NSLayoutConstraint *constraint2 = NULL;
    NSLayoutConstraint *constraint3 = NULL;
    NSLayoutConstraint *constraint4 = NULL;
    
    [view setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    if (constraintsTemplate == ConstraintsTemplate_LEFT_TOP_WIDTH_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [view addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_RIGHT_TOP_WIDTH_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [view addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_LEFT_BOTTOM_WIDTH_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [view addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_RIGHT_BOTTOM_WIDTH_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [view addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_LEFT_RIGHT_TOP_BOTTOM)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [parentView addConstraint:constraint3];
        [parentView addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_LEFT_RIGHT_TOP_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [parentView addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_LEFT_TOP_BOTTOM_WIDTH)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [parentView addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_RIGHT_TOP_BOTTOM_WIDTH)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [parentView addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_TOP_CENTER_X_WIDTH_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [view addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_LEFT_RIGHT_CENTER_Y_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [parentView addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_LEFT_RIGHT_CENTER_Y_HEIGHT_GORE)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [parentView addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_LEFT_CENTER_Y_WIDTH_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [view addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_RIGHT_CENTER_Y_WIDTH_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [view addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    else if (constraintsTemplate == ConstraintsTemplate_CENTER_X_CENTER_Y_WIDTH_HEIGHT)
    {
        constraint1 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:value1];
        constraint2 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:value2];
        constraint3 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value3];
        constraint4 = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:value4];
        
        [parentView addConstraint:constraint1];
        [parentView addConstraint:constraint2];
        [view addConstraint:constraint3];
        [view addConstraint:constraint4];
    }
    
    if (returnConstraints)
    {
        constraints = [[NSMutableArray alloc] init];
        [constraints addObject:constraint1];
        [constraints addObject:constraint2];
        [constraints addObject:constraint3];
        [constraints addObject:constraint4];
    }
    
    return constraints;
}

#pragma mark - Common
+(UIWindowLevel)topWindowLevel
{
    NSArray *windows = [[UIApplication sharedApplication] windows];
    UIWindow *lastWindow = (UIWindow *)[windows lastObject];
    return lastWindow.windowLevel + 1;
}

+(NSString *)xibNameWithString:(NSString *)string
{
    NSString *returnValue = NULL;
    if ([ZLToolbox deviceType] == DeviceType_IPHONE ||
        [ZLToolbox deviceType] == DeviceType_IPHONE_PLUS ||
        [ZLToolbox deviceType] == DeviceType_IPHONE_X)
    {
        returnValue = string;
    }
    else if ([ZLToolbox deviceType] == DeviceType_IPHONE_SE)
        returnValue = [NSString stringWithFormat:@"%@_SE", string];
    else if ([ZLToolbox deviceType] == DeviceType_IPAD)
        returnValue = [NSString stringWithFormat:@"%@_IPAD", string];
    else
        returnValue = string;
    
    NSString *temp = [[NSBundle mainBundle] pathForResource:returnValue ofType:@"nib"];
    if (!temp || [temp isEqualToString:@""])
        returnValue = string;
    
    return returnValue;
}

+(DeviceType)deviceType
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        if ((int)([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale) == 750)
            return DeviceType_IPHONE;
        else if ((int)([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale) == 1242)
            return DeviceType_IPHONE_PLUS;
        else if ((int)([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale) == 640)
            return DeviceType_IPHONE_SE;
        else if ((int)([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale) == 1125)
            return DeviceType_IPHONE_X;
        else
            return DeviceType_IPHONE;
    }
    else
        return DeviceType_IPAD;
}

#pragma mark - Localization
+(void)updateTextWithView:(UIView *)view Language:(NSString *)language
{
    if (!view)
        return;
    
    for (UIView *subView in [view subviews])
    {
        if ([subView isKindOfClass:[UILabel class]])
        {
            UILabel *lbl = (UILabel *)subView;
            NSString *keyString = [lbl.layer valueForKey:ZL_CONSTS_KEY_LOCALIZATION_KEY];
            if (!keyString) keyString = [ZLToolbox innerText:[lbl text]];
            if (keyString && ![keyString isEqualToString:@""])
            {
                [lbl.layer setValue:keyString forKey:ZL_CONSTS_KEY_LOCALIZATION_KEY];
                [lbl setText:[ZLToolbox localizedStringWithKey:keyString Language:language]];
            }
        }
        else if ([subView isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)subView;
            NSString *keyString = [btn.layer valueForKey:ZL_CONSTS_KEY_LOCALIZATION_KEY];
            if (!keyString) keyString = [ZLToolbox innerText:[btn.titleLabel text]];
            if (keyString && ![keyString isEqualToString:@""])
            {
                [btn.layer setValue:keyString forKey:ZL_CONSTS_KEY_LOCALIZATION_KEY];
                [ZLToolbox setTitle:[ZLToolbox localizedStringWithKey:keyString Language:language] Button:btn];
            }
        }
        else
            [ZLToolbox updateTextWithView:subView Language:language];
    }
}

+(NSString *)innerText:(NSString *)string
{
    NSString *result = NULL;
    
    if (string && ![string isEqualToString:@""])
        if ([string hasPrefix:@"["] && [string hasSuffix:@"]"])
            result = [string substringWithRange:NSMakeRange(1, string.length - 2)];
    
    return result;
}

+(NSString *)localizedStringWithKey:(NSString *)key Language:(NSString *)language
{
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]];
    return NSLocalizedStringFromTableInBundle(key, @"Localizable", bundle, NULL);
}

#pragma mark - Other
+(id)safeGetObjectFromDictionary:(NSDictionary *)dictionary Key:(NSString *)key
{
    id value = NULL;
    if (dictionary && [dictionary count])
    {
        value = [dictionary objectForKey:key];
        if ([value isEqual:[NSNull null]])
            value = NULL;
    }
    return value;
}

@end
