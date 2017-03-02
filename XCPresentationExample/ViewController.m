//
//  ViewController.m
//  XCPresentationExample
//
//  Created by 樊小聪 on 2017/3/2.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"

#import "XCPresentation.h"

#import "XCTextViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)didClickAction:(UIButton *)sender
{
    XCTextViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XCTextViewController"];
    
    vc.presentStyle = sender.tag - 100;
    
    XCPresentTransitionStyle style = sender.tag - 100;
    
    [XCPresentation presentWithPresentedViewController:vc presentingViewController:self presentStyle:style];
}

@end
