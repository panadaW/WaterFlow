//
//  MyWaterViewController.m
//  WaterLayout
//
//  Created by 王明申 on 15/11/12.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "MyWaterViewController.h"
#import "MyWaterLayout.h"

@interface MyWaterViewController ()

@end

@implementation MyWaterViewController

static NSString * const reuseIdentifier = @"WaterCell";

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

    return 40;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark <UICollectionViewDelegate>



@end
