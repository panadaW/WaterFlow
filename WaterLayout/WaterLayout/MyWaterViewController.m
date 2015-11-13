//
//  MyWaterViewController.m
//  WaterLayout
//
//  Created by 王明申 on 15/11/12.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "MyWaterViewController.h"
#import "MyWaterLayout.h"
#import "MyWaterCell.h"
#import <MJExtension.h>
#import "MyCloths.h"

@interface MyWaterViewController ()
@property(nonatomic,strong)NSMutableArray *clothArray;
@end

@implementation MyWaterViewController

static NSString * const reuseIdentifier = @"WaterCell";
-(NSMutableArray *)clothArray {
    if (_clothArray == nil) {
        _clothArray = [NSMutableArray array];
        NSArray *array = [MyCloths mj_objectArrayWithFilename:@"clothes.plist"];
        [_clothArray addObjectsFromArray:array];
    }
    return _clothArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.collectionViewLayout = [[MyWaterLayout alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.clothArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyWaterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.cloths = self.clothArray[indexPath.item];
    return cell;
}

#pragma mark <UICollectionViewDelegate>



@end
