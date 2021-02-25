//
//  ZLBookCell.h
//  ZolotyjLev
//
//  Created by Oleh Piskorskyj on 12.02.17.
//  Copyright © 2017 MetallicRain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    ZLBookCellSelectionType_RIGHT = 0,
    ZLBookCellSelectionType_LEFT = 1
} ZLBookCellSelectionType;

@protocol ZLBookCellData<NSObject>
-(UIImage *)ZLBookCellDataImage;
-(int)ZLBookCellDataPK;
@end

@interface ZLBookCell : UIView
{
@private ZLBookCellSelectionType mSelectionType;
@private NSObject<ZLBookCellData> *mData;
@private UIView *mViewSelectedRight;
@private UIView *mViewSelectedLeft;
@private UIButton *mButton;
@private UIImageView *mImageView;
}

-(ZLBookCell *)initWithSelectorWidth:(float)selectorWidth;
-(void)setData:(NSObject<ZLBookCellData> *)data Selected:(BOOL)selected;
-(void)setSelectionType:(ZLBookCellSelectionType)selectionType;
-(NSObject<ZLBookCellData> *)data;
-(UIView *)viewSelectedRight;
-(UIView *)viewSelectedLeft;
-(UIButton *)button;

@end
