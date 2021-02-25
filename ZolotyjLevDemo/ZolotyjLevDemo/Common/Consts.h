//
//  Consts.h
//  Czarocvit
//
//  Created by Oleh Piskorskyj on 03.11.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#ifndef Consts_h
#define Consts_h

#pragma mark - COMMON
#define CONSTS_START_PLAYER_YAW_ANGLE                                               0.0f
#define CONSTS_START_PLAYER_PITCH_ANGLE                                             M_PI_2

#pragma mark - CAMERA
#define CONSTS_CAMERA_FIELD_OF_VIEW                                                 65.0f
#define CONSTS_CAMERA_NEAR_PLANE                                                    0.01f
#define CONSTS_CAMERA_FAR_PLANE                                                     128.0f
#define CONSTS_CAMERA_FAR_PLANE_FAR                                                 512.0f
#define CONSTS_CAMERA_INITIAL_YAW_ANGLE                                             M_PI_2 * 3.0f
#define CONSTS_CAMERA_INITIAL_PITCH_ANGLE                                           M_PI_2

#pragma mark - GEOMETRY
#define CONSTS_GEOMETRY_SQUARE_VERTICES_COUNT                                       4
#define CONSTS_GEOMETRY_SQUARE_INDICES_COUNT                                        6
#define CONSTS_GEOMETRY_CUBE_VERTICES_COUNT                                         24
#define CONSTS_GEOMETRY_CUBE_INDICES_COUNT                                          36

#pragma mark - COLOR
#define CONSTS_COLOR_FOG_LIGHT_RED                                                  0.6196f     //158
#define CONSTS_COLOR_FOG_LIGHT_GREEN                                                0.8470f     //216
#define CONSTS_COLOR_FOG_LIGHT_BLUE                                                 0.9843f     //251
#define CONSTS_COLOR_TINT_RED                                                       1.0f
#define CONSTS_COLOR_TINT_GREEN                                                     0.0f
#define CONSTS_COLOR_TINT_BLUE                                                      0.0f
#define CONSTS_COLOR_DEFAULT                                                        [UIColor colorWithRed:236.0f / 255.0f green:222.0f / 255.0f blue:197.0f / 255.0f alpha:1.0f]
#define CONSTS_COLOR_DEFAULT_TRANSPARENT                                            [UIColor colorWithRed:236.0f / 255.0f green:222.0f / 255.0f blue:197.0f / 255.0f alpha:0.6f]

#pragma mark - DIMENSION
#define CONSTS_DIMENSION_MAIN_SCALE                                                 4.0f
#define CONSTS_DIMENSION_BRICK_INTERSECTION_TARGET_RADIUS                           0.5f
#define CONSTS_DIMENSION_BRICK_INTERSECTION_TARGET_CENTER_X                         0.0f
#define CONSTS_DIMENSION_BRICK_INTERSECTION_TARGET_CENTER_Y                         0.5f
#define CONSTS_DIMENSION_BRICK_INTERSECTION_TARGET_CENTER_Z                         0.0f
#define CONSTS_DIMENSION_BRICK_SCALE                                                CONSTS_DIMENSION_MAIN_SCALE * 4.0f

#pragma mark - DISTANCE
#define CONSTS_DISTANCE_VISIBLE                                                     130.0f
#define CONSTS_DISTANCE_VISIBLE_FAR                                                 512.0f

#endif
