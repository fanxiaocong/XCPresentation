//
//  ViewController.m
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"

#import "XCPresentation.h"
#import "XCPresentationBubbleAnimation.h"
#import "XCPresentationScaleAnimation.h"
#import "XCPresentationAlertAnimation.h"
#import "XCPresentationPanAnimation.h"
#import "XCPresentationExplodeAnimation.h"

#import "XXXViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 🎬 👀 Action Method 👀

/** 👀 显示 Bubble 弹框 👀 */
- (IBAction)showBubblePresent:(UIButton *)btn
{
    XXXViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XXX"];
    vc.presentStyle = PresentStyleBubble;
    
    XCPresentationBubbleAnimation *animation = [[XCPresentationBubbleAnimation alloc] init];
    animation.sourceRect  = btn.frame;
    animation.strokeColor = btn.backgroundColor;
    
    [XCPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}

/** 👀 显示缩放动画 👀 */
- (IBAction)showScalePresent:(UIButton *)sender
{
    XXXViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XXX"];
    vc.presentStyle = PresentStyleScale;
    
    XCPresentationScaleAnimation *animation = [[XCPresentationScaleAnimation alloc] init];
    animation.animationView = self.imgView;
    animation.sourceFrame   = self.imgView.frame;
    animation.destFrame     = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    
    [XCPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}


/** 👀 显示 Alert 弹框 👀 */
- (IBAction)showAlertPresent:(UIButton *)sender
{
    XXXViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XXX"];
    vc.presentStyle = PresentStyleAlert;
    
    XCPresentationAlertAnimation *animation = [[XCPresentationAlertAnimation alloc] init];
    animation.presentStyle = AlertAnimationPresentStyleFromTop;
    animation.dismissStyle = AlertAnimationDismissStyleToRight;
    
    [XCPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}

/** 👀 显示 平移动画 👀 */
- (IBAction)showPanPresent:(UIButton *)sender
{
    XXXViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XXX"];
    vc.presentStyle = PresentStylePan;
    
    XCPresentationPanAnimation *animation = [[XCPresentationPanAnimation alloc] init];
    animation.presentStyle = PanAnimationPresentStyleFromCenter;
    
    [XCPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}

- (IBAction)showExplodePresent:(id)sender
{
    XXXViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XXX"];
    vc.presentStyle = PresentStyleBubble;
    
    XCPresentationExplodeAnimation *animation = [[XCPresentationExplodeAnimation alloc] init];
    
    [XCPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}

@end
