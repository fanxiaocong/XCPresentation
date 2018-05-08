//
//  XCPresentationAnimation.m
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCPresentationAnimation.h"

@implementation XCPresentationAnimation

#pragma mark - 👀 Init Method 👀 💤

- (instancetype)init
{
    if (self = [super init])
    {
        [self setupDefaults];
    }
    
    return self;
}

// 设置默认参数
- (void)setupDefaults
{
    _duration = .3f;
    _style    = XCPresentationAnimationStylePresent;
}

#pragma mark - 🔓 👀 Public Method 👀

/**
 *  开始动画，具体动画实现细节，由子类去实现
 */
- (void)beginAnimation {}

/**
 *  结束动画
 */
- (void)endAnimation
{
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
}

#pragma mark - 💉 👀 UIViewControllerAnimatedTransitioning 👀

/**
 *  转场动画时间
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

/**
 *  动画的具体实现
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = fromViewController.view;
    UIView *toView   = toViewController.view;
    
    UIView *contaionerView = [transitionContext containerView];
    _transitionContext = transitionContext;
    
    _fromViewController = fromViewController;
    _toViewController   = toViewController;
    _fromView       = fromView;
    _toView         = toView;
    _contaionerView = contaionerView;
        
    /// 动画事件
    [self beginAnimation];
}

@end
