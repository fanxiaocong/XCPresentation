//
//  XCTextViewController.m
//  转场动画
//
//  Created by 樊小聪 on 2016/12/29.
//  Copyright © 2016年 樊小聪. All rights reserved.
//

#import "XCTextViewController.h"

@interface XCTextViewController ()

@property (weak, nonatomic) IBOutlet UILabel *centerLB;

@end

@implementation XCTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    switch (self.presentStyle)
    {
        case XCTextPresentStyleCenter:
        {
            self.centerLB.text = @"我是从中间弹出的";
            self.preferredContentSize = CGSizeMake(300, 200);
            break;
        }
        case XCTextPresentStyleRight:
        {
            self.centerLB.text = @"我是从右边弹出的";
            self.preferredContentSize = CGSizeMake(CGRectGetWidth(self.view.bounds) * 0.75, CGRectGetHeight(self.view.bounds));
            break;
        }
        case XCTextPresentStyleBottom:
        {
            self.centerLB.text = @"我是从底部弹出的";
            self.preferredContentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) * 0.4);
            break;
        }
    }
}


@end











