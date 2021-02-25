//
//  ZLBook.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 12.02.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLBookCell.h"

@interface ZLBook : NSObject
{
@private int mSelectedPK;
@private int mPage;
@private NSArray *mData;
@private NSMutableArray *mCells;
@private UIColor *mSelectedColor;
@private UIView *mViewLeft;
@private UIView *mViewRight;
@private float mCellPaddingX;
@private float mCellPaddingY;
@private float mCellSize;
@private float mCellSelectorWidth;
    
@private void (^mSelectCellAction)(void *, NSObject<ZLBookCellData> *);
@private void *mSelectCellActionOwner;
}

-(ZLBook *)initWithLeftView:(UIView *)leftView RightView:(UIView *)rightView CellPaddingX:(float)cellPaddingX CellPaddingY:(float)cellPaddingY CellSize:(float)cellSize CellSelectorWidth:(float)cellSelectorWidth SelectedColor:(UIColor *)selectedColor;
-(void)setSelectCellAction:(void (^)(void *, NSObject<ZLBookCellData> *))action Owner:(void *)owner;
-(void)setSelectedColor:(UIColor *)selectedColor;
-(void)setSelectedPK:(int)selectedPK;
-(void)setData:(NSArray *)data;
-(void)setPage:(int)page;
-(void)previousPage;
-(void)nextPage;
-(void)refresh;

@end
