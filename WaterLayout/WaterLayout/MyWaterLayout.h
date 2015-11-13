//
//  MyWaterLayout.h
//  WaterLayout
//
//  Created by 王明申 on 15/11/12.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyWaterLayout;
@protocol MyWaterLayoutDelegate <NSObject>
@required
-(CGFloat)collectionFayout:(MyWaterLayout *)layout heightForRowIndex:(NSIndexPath *)index WidthForSelectCell:(CGFloat)width;
@end
@interface MyWaterLayout : UICollectionViewLayout
@property(nonatomic,weak)id<MyWaterLayoutDelegate> deledate;
@end
