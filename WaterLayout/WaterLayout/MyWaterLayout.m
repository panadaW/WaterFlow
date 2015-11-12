//
//  MyWaterLayout.m
//  WaterLayout
//
//  Created by 王明申 on 15/11/12.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "MyWaterLayout.h"
#define MyCollectionViewWidth self.collectionView.frame.size.width
//设置最大行间距
static const CGFloat MaxRowSpace = 10;
//设置最大列间距
static const  CGFloat MaxColSpace = 10;
//列数
static const CGFloat ColTotol = 3;
//边距
static const UIEdgeInsets MyInsets = {10, 10, 10, 10};
@interface MyWaterLayout ()
//保存每一列的最大Y值
@property(nonatomic,strong)NSMutableArray* MaxColY;
//保存布局属性
@property(nonatomic,strong)NSMutableArray *attrsArray;
@end
@implementation MyWaterLayout
//懒加载
-(NSMutableArray *)MaxColY {
    if (_MaxColY == nil) {
        _MaxColY = [NSMutableArray array];
    }
    return _MaxColY;
}
-(NSMutableArray *)attrsArray {
    if (_attrsArray == nil) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}
//每次布局发生改变是调用
-(void)prepareLayout {
    [super prepareLayout];
    [self.MaxColY removeAllObjects];
//    初始化MaxColY
    for (int i = 0; i < ColTotol; i++) {
        [self.MaxColY addObject:@(0)];
    }
    [self.attrsArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    //    给每个元素设置想对应的index
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexpath];
        [self.attrsArray addObject:attrs];


}
}
-(CGSize)collectionViewContentSize {
    //    遍历MaxColY求每列最大y值
       CGFloat firstMaxYCol = [self.MaxColY[0] doubleValue];
       for (int i = 1; i < self.MaxColY.count; i++) {
        if (firstMaxYCol < [self.MaxColY[i] doubleValue]) {
            firstMaxYCol = [self.MaxColY[i] doubleValue];
           
        }
    }
    return CGSizeMake(MyCollectionViewWidth, firstMaxYCol + MyInsets.bottom);

}
//每个元素的布局属性
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
//    NSMutableArray *array = [NSMutableArray array];
////    总共多少元素
//    NSInteger count = [self.collectionView numberOfItemsInSection:0];
////    给每个元素设置想对应的index
//    for (int i = 0; i < count; i++) {
//        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
//        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexpath];
//        [array addObject:attrs];
//        
//    }
    return self.attrsArray;

}
//设置每个cell的布局属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    遍历MaxColY求每列最小y值
//   最短列的下表及最大y坐标
    CGFloat firstMaxYCol = [self.MaxColY[0] doubleValue];
//    对应下表
    NSUInteger index = 0;
    for (int i = 1; i < self.MaxColY.count; i++) {
        if (firstMaxYCol > [self.MaxColY[i] doubleValue]) {
            firstMaxYCol = [self.MaxColY[i] doubleValue];
            index = i;
        }
    }
    CGFloat totalColYSpace = (ColTotol - 1) * MaxColSpace;
    CGFloat w = (MyCollectionViewWidth - MyInsets.left - MyInsets.right -totalColYSpace) / ColTotol;
    CGFloat h = 40 + arc4random_uniform(120);
    CGFloat x = MyInsets.left + index * (w + MaxColSpace);
    CGFloat y = firstMaxYCol + MaxRowSpace;
    attrs.frame = CGRectMake(x, y, w, h);
//    更新的最大Y值
    self.MaxColY[index] = @(CGRectGetMaxY(attrs.frame));
    return attrs;
}
@end
