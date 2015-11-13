//
//  MyWaterCell.m
//  WaterLayout
//
//  Created by 王明申 on 15/11/13.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//
#import "MyCloths.h"
#import <UIImageView+WebCache.h>


#import "MyWaterCell.h"
@interface MyWaterCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@end
@implementation MyWaterCell
-(void)setCloths:(MyCloths *)cloths {
    _cloths = cloths;
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:cloths.img] placeholderImage:[UIImage imageNamed:@"loading.png"]];
    self.priceLable.text = cloths.price;

}
@end
