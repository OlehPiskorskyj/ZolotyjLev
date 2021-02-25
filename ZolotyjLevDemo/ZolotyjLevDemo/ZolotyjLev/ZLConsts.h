//
//  ZLConsts.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 18.05.16.
//  Copyright © 2016 MetallicRain. All rights reserved.
//

#ifndef ZLConsts_h
#define ZLConsts_h

#pragma mark - COMMON
#define ZL_CONSTS_ALERT_WINDOW_TEG                                                  66
#define ZL_CONSTS_LIGHTS_QUANTITY                                                   4

#pragma mark - CAMERA
#define ZL_CONSTS_CAMERA_FIELD_OF_VIEW                                              65.0f
#define ZL_CONSTS_CAMERA_NEAR_PLANE                                                 0.01f
#define ZL_CONSTS_CAMERA_FAR_PLANE                                                  128.0f
#define ZL_CONSTS_CAMERA_FAR_PLANE_FAR                                              512.0f
#define ZL_CONSTS_CAMERA_INITIAL_YAW_ANGLE                                          M_PI_2 * 3.0f
#define ZL_CONSTS_CAMERA_INITIAL_PITCH_ANGLE                                        M_PI_2

#pragma mark - SHADER VERTEX
#define ZL_CONSTS_SHADER_VERTEX_DEFAULT                                             @"VertexDefault"
#define ZL_CONSTS_SHADER_VERTEX_COLOR                                               @"VertexColor"
#define ZL_CONSTS_SHADER_VERTEX_COLOR_FOG                                           @"VertexColorFog"
#define ZL_CONSTS_SHADER_NAME_VERTEX_TEXTURE                                        @"VertexTexture"
#define ZL_CONSTS_SHADER_NAME_VERTEX_TEXTURE_DIFFUSE_1                              @"VertexTextureDiffuse1"
#define ZL_CONSTS_SHADER_NAME_VERTEX_TEXTURE_DIFFUSE_2                              @"VertexTextureDiffuse2"
#define ZL_CONSTS_SHADER_NAME_VERTEX_TEXTURE_SPECULAR                               @"VertexTextureSpecular"

#pragma mark - SHADER FRAGMENT
#define ZL_CONSTS_SHADER_FRAGMENT_DEFAULT                                           @"FragmentDefault"
#define ZL_CONSTS_SHADER_FRAGMENT_COLOR                                             @"FragmentColor"
#define ZL_CONSTS_SHADER_FRAGMENT_COLOR_FOG                                         @"FragmentColorFog"
#define ZL_CONSTS_SHADER_NAME_FRAGMENT_TEXTURE                                      @"FragmentTexture"
#define ZL_CONSTS_SHADER_NAME_FRAGMENT_TEXTURE_DIFFUSE_1                            @"FragmentTextureDiffuse1"
#define ZL_CONSTS_SHADER_NAME_FRAGMENT_TEXTURE_DIFFUSE_2                            @"FragmentTextureDiffuse2"
#define ZL_CONSTS_SHADER_NAME_FRAGMENT_TEXTURE_SPECULAR                             @"FragmentTextureSpecular"

#pragma mark - SHADER ATTRIBUTES
#define ZL_CONSTS_SHADER_ATTRIBUTE_POSITION                                         "Position"
#define ZL_CONSTS_SHADER_ATTRIBUTE_COLOR                                            "Color"
#define ZL_CONSTS_SHADER_ATTRIBUTE_TEXTURE_COORD                                    "TextureCoord"
#define ZL_CONSTS_SHADER_ATTRIBUTE_NORMAL                                           "Normal"

#pragma mark - SHADER UNIFORMS
#define ZL_CONSTS_SHADER_UNIFORM_PROJECTION                                         "Projection"
#define ZL_CONSTS_SHADER_UNIFORM_LOOK_AT                                            "LookAt"
#define ZL_CONSTS_SHADER_UNIFORM_MODEL_VIEW                                         "ModelView"
#define ZL_CONSTS_SHADER_UNIFORM_LIGHT_POSITION                                     "LightPosition"
#define ZL_CONSTS_SHADER_UNIFORM_LIGHT_COLOR                                        "LightColor"
#define ZL_CONSTS_SHADER_UNIFORM_LIGHT_ATTENUATION                                  "LightAttenuation"
#define ZL_CONSTS_SHADER_UNIFORM_LIGHT_INTENSITY                                    "LightIntensity"
#define ZL_CONSTS_SHADER_UNIFORM_LIGHTS_POSITIONS_FORMAT                            @"LightPosition[%d]"
#define ZL_CONSTS_SHADER_UNIFORM_LIGHTS_COLOURS_FORMAT                              @"LightColor[%d]"
#define ZL_CONSTS_SHADER_UNIFORM_LIGHTS_INTENSITIES_FORMAT                          @"LightIntensity[%d]"
#define ZL_CONSTS_SHADER_UNIFORM_LIGHTS_ATTENUATIONS_FORMAT                         @"Attenuation[%d]"
#define ZL_CONSTS_SHADER_UNIFORM_MATERIAL_SHINE_DEMPER                              "ShineDemper"
#define ZL_CONSTS_SHADER_UNIFORM_MATERIAL_REFLECTIVITY                              "Reflectivity"
#define ZL_CONSTS_SHADER_UNIFORM_FOG_COLOR                                          "FogColor"
#define ZL_CONSTS_SHADER_UNIFORM_TINT_COLOR                                         "TintColor"
#define ZL_CONSTS_SHADER_UNIFORM_TINT_COLOR_INTENSITY                               "TintColorIntensity"
#define ZL_CONSTS_SHADER_UNIFORM_ALPHA                                              "Alpha"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE                                            "Texture"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_BACKGROUND                                 "TextureBackground"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_RED                                        "TextureRed"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_GREEN                                      "TextureGreen"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_BLUE                                       "TextureBlue"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_BLEND_MAP                                  "TextureBlendMap"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_CUBE_MAP                                   "TextureCubeMap"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_CUBE_MAP_2                                 "TextureCubeMap2"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_COORD_OFFSET                               "TextureCoordOffset"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_ROWS_COUNT                                 "TextureRowsCount"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURE_TILE_FACTOR                                "TextureTileFactor"
#define ZL_CONSTS_SHADER_UNIFORM_TEXTURES_BLEND_FACTOR                              "TexturesBlendFactor"

#pragma mark - KEYS
#define ZL_CONSTS_KEY_LOCALIZATION_KEY                                              @"localizationKey"

#endif
