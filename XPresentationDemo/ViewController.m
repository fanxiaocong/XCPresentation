//
//  ViewController.m
//  XPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"

#import "XPresentation.h"
#import "XPresentationBubbleAnimation.h"
#import "XPresentationScaleAnimation.h"
#import "XPresentationAlertAnimation.h"
#import "XPresentationPanAnimation.h"
#import "XPresentationExplodeAnimation.h"

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
    
    XPresentationBubbleAnimation *animation = [[XPresentationBubbleAnimation alloc] init];
    animation.sourceRect  = btn.frame;
    animation.strokeColor = btn.backgroundColor;
    
    [XPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}

/** 👀 显示缩放动画 👀 */
- (IBAction)showScalePresent:(UIButton *)sender
{
    XXXViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XXX"];
    vc.presentStyle = PresentStyleScale;
    
    XPresentationScaleAnimation *animation = [[XPresentationScaleAnimation alloc] init];
    animation.animationView = self.imgView;
    animation.sourceFrame   = self.imgView.frame;
    animation.destFrame     = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    
    [XPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}


/** 👀 显示 Alert 弹框 👀 */
- (IBAction)showAlertPresent:(UIButton *)sender
{
    XXXViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XXX"];
    vc.presentStyle = PresentStyleAlert;
    
    XPresentationAlertAnimation *animation = [[XPresentationAlertAnimation alloc] init];
    animation.presentStyle = AlertAnimationPresentStyleFromTop;
    animation.dismissStyle = AlertAnimationDismissStyleToRight;
    
    [XPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}

/** 👀 显示 平移动画 👀 */
- (IBAction)showPanPresent:(UIButton *)sender
{
    XXXViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XXX"];
    vc.presentStyle = PresentStylePan;
    
    XPresentationPanAnimation *animation = [[XPresentationPanAnimation alloc] init];
    animation.presentStyle = PanAnimationPresentStyleFromCenter;
    
    [XPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}

- (IBAction)showExplodePresent:(id)sender
{
    XXXViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"XXX"];
    vc.presentStyle = PresentStyleBubble;
    
    XPresentationExplodeAnimation *animation = [[XPresentationExplodeAnimation alloc] init];
    
    [XPresentation presentWithPresentationAnimation:animation presentedViewController:vc presentingViewController:self];
}

@end
