//
//  ZLBookCell.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 12.02.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "ZLBookCell.h"
#import "ZLToolbox.h"

#ifndef ZLBookCell_CONSTS
#define ZLBookCell_CONSTS
#define ZLBookCell_PADDING                                      2.0f
#endif

@implementation ZLBookCell

#pragma mark - Ctors/Dctor
-(ZLBookCell *)initWithSelectorWidth:(float)selectorWidth
{
    self = [super init];
    if (self)
    {
        mSelectionType = ZLBookCellSelectionType_RIGHT;
        
        mViewSelectedRight = [[UIView alloc] init];
        [mViewSelectedRight setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [mViewSelectedRight setBackgroundColor:[UIColor redColor]];
        [self addSubview:mViewSelectedRight];
        [mViewSelectedRight release];
        
        mViewSelectedLeft = [[UIView alloc] init];
        [mViewSelectedLeft setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [mViewSelectedLeft setBackgroundColor:[UIColor redColor]];
        [self addSubview:mViewSelectedLeft];
        [mViewSelectedLeft release];
        
        mImageView = [[UIImageView alloc] init];
        [mImageView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [self addSubview:mImageView];
        [mImageView release];
        
        mButton = [[UIButton alloc] init];
        [mButton setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [self addSubview:mButton];
        [mButton release];
        
        float paddingSelectorX = selectorWidth * 2.0f;
        [ZLToolbox addConstraints2View:mViewSelectedRight ParentView:self ConstraintsTemplate:ConstraintsTemplate_RIGHT_TOP_BOTTOM_WIDTH Value1:paddingSelectorX Value2:ZLBookCell_PADDING Value3:-ZLBookCell_PADDING Value4:selectorWidth];
        [ZLToolbox addConstraints2View:mViewSelectedLeft ParentView:self ConstraintsTemplate:ConstraintsTemplate_LEFT_TOP_BOTTOM_WIDTH Value1:-paddingSelectorX Value2:ZLBookCell_PADDING Value3:-ZLBookCell_PADDING Value4:selectorWidth];
        [ZLToolbox addConstraints2View:mImageView ParentView:self ConstraintsTemplate:ConstraintsTemplate_LEFT_RIGHT_TOP_BOTTOM Value1:ZLBookCell_PADDING Value2:-ZLBookCell_PADDING Value3:ZLBookCell_PADDING Value4:-ZLBookCell_PADDING];
        [ZLToolbox addConstraints2View:mButton ParentView:self ConstraintsTemplate:ConstraintsTemplate_LEFT_RIGHT_TOP_BOTTOM];
    }
    return self;
}

-(void)dealloc
{
    if (mData) [mData release];
    [super dealloc];
}

#pragma mark - Events

#pragma mark - Public methods
-(void)setData:(NSObject<ZLBookCellData> *)data Selected:(BOOL)selected
{
    if (mData != data)
    {
        if (mData)
            [mData release];
        [data retain];
        mData = data;
    }
    
    [mImageView setImage:[data ZLBookCellDataImage]];
    
    [mViewSelectedRight setHidden:TRUE];
    [mViewSelectedLeft setHidden:TRUE];
    
    if (selected)
    {
        if (mSelectionType == ZLBookCellSelectionType_RIGHT)
            [mViewSelectedRight setHidden:FALSE];
        else
            [mViewSelectedLeft setHidden:FALSE];
    }
}

-(void)setSelectionType:(ZLBookCellSelectionType)selectionType
{
    mSelectionType = selectionType;
}

-(NSObject<ZLBookCellData> *)data
{
    return mData;
}

-(UIView *)viewSelectedRight
{
    return mViewSelectedRight;
}

-(UIView *)viewSelectedLeft
{
    return mViewSelectedLeft;
}

-(UIButton *)button
{
    return mButton;
}

#pragma mark - Other methods

@end
