//
//  YSScrollView.h
//  YSDemo
//
//  Created by Daniel on 16/3/17.
//  Copyright © 2016年 luantianshu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSScrollView : UIView

- (instancetype)initWithFrame:(CGRect)frame pageWidth:(CGFloat)pageWidth;

-(void)loadImages:(NSArray *)array;

@end
