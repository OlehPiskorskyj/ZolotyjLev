//
//  ZLBook.m
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 12.02.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import "ZLBook.h"
#import "ZLToolbox.h"

#ifndef ZLBook_CONSTS
#define ZLBook_CONSTS
#define ZLBook_CELLS_COUNT_HALF                                 6
#define ZLBook_CELLS_COUNT                                      ZLBook_CELLS_COUNT_HALF * 2
#endif

@implementation ZLBook

#pragma mark - Ctors/Dctor
-(ZLBook *)initWithLeftView:(UIView *)leftView RightView:(UIView *)rightView CellPaddingX:(float)cellPaddingX CellPaddingY:(float)cellPaddingY CellSize:(float)cellSize CellSelectorWidth:(float)cellSelectorWidth SelectedColor:(UIColor *)selectedColor
{
    self = [super init];
    if (self)
    {
        mSelectedPK = 0;
        mPage = 0;
        mViewLeft = leftView;
        mViewRight = rightView;
        mCellPaddingX = cellPaddingX;
        mCellPaddingY = cellPaddingY;
        mCellSize = cellSize;
        mCellSelectorWidth = cellSelectorWidth;
        
        [selectedColor retain];
        mSelectedColor = selectedColor;
        
        [self initCells];
    }
    return self;
}

-(void)dealloc
{
    if (mData) [mData release];
    if (mCells) [mCells release];
    if (mSelectedColor) [mSelectedColor release];
    [super dealloc];
}

#pragma mark - Events
-(void)btnClick:(UIButton *)sender
{
    ZLBookCell *cell = (ZLBookCell *)[sender superview];
    if (mSelectCellAction) mSelectCellAction(mSelectCellActionOwner, [cell data]);
}

#pragma mark - Public methods
-(void)setSelectCellAction:(void (^)(void *, NSObject<ZLBookCellData> *))action Owner:(void *)owner
{
    mSelectCellActionOwner = owner;
    mSelectCellAction = action;
}

-(void)setSelectedColor:(UIColor *)selectedColor
{
    if (mSelectedColor != selectedColor)
    {
        if (mSelectedColor)
            [mSelectedColor release];
        [selectedColor retain];
        mSelectedColor = selectedColor;
    }
}

-(void)setSelectedPK:(int)selectedPK
{
    mSelectedPK = selectedPK;
}

-(void)setData:(NSArray *)data
{
    if (mData != data)
    {
        if (mData)
            [mData release];
        [data retain];
        mData = data;
    }
    
    [self setPage:0];
}

-(void)setPage:(int)page
{
    if (page < 0)
        return;
    
    int indexDelta = page * ZLBook_CELLS_COUNT;
    if (mData && indexDelta < [mData count])
    {
        mPage = page;
        
        for (int i = 0; i < ZLBook_CELLS_COUNT; i++)
        {
            ZLBookCell *cell = [mCells objectAtIndex:i];
            if (i + indexDelta < [mData count])
            {
                NSObject<ZLBookCellData> *data = [mData objectAtIndex:i + indexDelta];
                BOOL selected = [data ZLBookCellDataPK] == mSelectedPK;
                [cell setData:data Selected:selected];
                [cell setHidden:FALSE];
            }
            else
            {
                [cell setHidden:TRUE];
            }
        }
    }
}

-(void)previousPage
{
    [self setPage:mPage - 1];
}

-(void)nextPage
{
    [self setPage:mPage + 1];
}

-(void)refresh
{
    [self setPage:mPage];
}

#pragma mark - Other methods
-(void)initCells
{
    if (!mCells)
    {
        mCells = [[NSMutableArray alloc] init];
        
        UIView *parentView = mViewLeft;
        float y = mCellPaddingY;
        
        for (int i = 0; i < ZLBook_CELLS_COUNT; i++)
        {
            ZLBookCell *cell = [[ZLBookCell alloc] initWithSelectorWidth:mCellSelectorWidth];
            [[cell viewSelectedRight] setBackgroundColor:mSelectedColor];
            [[cell viewSelectedLeft] setBackgroundColor:mSelectedColor];
            [[cell button] addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i > 5 && parentView == mViewLeft)
            {
                parentView = mViewRight;
                y = mCellPaddingY;
            }
            
            [parentView addSubview:cell];
            [cell release];
            
            if (!(i % 2))
            {
                [ZLToolbox addConstraints2View:cell ParentView:parentView ConstraintsTemplate:ConstraintsTemplate_LEFT_TOP_WIDTH_HEIGHT Value1:mCellPaddingX Value2:y Value3:mCellSize Value4:mCellSize];
                [cell setSelectionType:ZLBookCellSelectionType_LEFT];
            }
            else
            {
                
                [ZLToolbox addConstraints2View:cell ParentView:parentView ConstraintsTemplate:ConstraintsTemplate_RIGHT_TOP_WIDTH_HEIGHT Value1:-mCellPaddingX Value2:y Value3:mCellSize Value4:mCellSize];
                [cell setSelectionType:ZLBookCellSelectionType_RIGHT];
                
                y += mCellSize + mCellPaddingY;
            }
            
            [mCells addObject:cell];
            [cell release];
        }
    }
}

@end
