//
//  ViewController.m
//  YSDemo
//
//  Created by luantianshu on 16/3/17.
//  Copyright © 2016年 luantianshu. All rights reserved.
//

#import "ViewController.h"
#import "YSScrollView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.leftLabel.text = @"o any additional setup af";
    self.rightLabel.text = @"    // Do any additional setup after loading the view, typically from a nib.";
    
    YSScrollView *scrollView =[[YSScrollView alloc] initWithFrame:self.view.bounds pageWidth:240];
    [self.view addSubview:scrollView];
    
    [scrollView loadImages:@[@"0.jpg",@"1.png",@"2.png",@"3.png"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
