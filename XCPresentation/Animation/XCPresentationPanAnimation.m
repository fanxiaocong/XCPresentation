//
//  XCPresentationPanAnimation.m
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：平移动画 🐾
 */

#import "XCPresentationPanAnimation.h"


#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height


@implementation XCPresentationPanAnimation

- (instancetype)init
{
    if (self = [super init]) {
        /// 设置默认配置
        [self setupDefaults];
    }
    return self;
}

/**
 *  设置默认配置
 */
- (void)setupDefaults
{
    self.duration = .4f;
    _presentStyle = XCPanAnimationPresentStyleFromCenter;
}

#pragma mark - 👀 Override 👀 💤

- (void)beginAnimation
{
    switch (self.style) {
        case XCPresentationAnimationStylePresent: {
            [self presentAnimation];
            break;
        }
        case XCPresentationAnimationStyleDismiss: {
            [self dismissAnimation];
            break;
        }
    }
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  present 动画
 */
- (void)presentAnimation
{
    [self.contaionerView addSubview:self.toView];
    
    UIView *animationView    = self.toView;
    CGSize animationViewSize = self.toViewController.preferredContentSize;
    
    CGFloat viewW = animationViewSize.width;
    CGFloat viewH = animationViewSize.height;
    
    NSTimeInterval duration = self.duration;
    
    CGAffineTransform fromTransform, toTransform;
    
    animationView.frame = CGRectMake(0, 0, viewW, viewH);
    
    switch (self.presentStyle) {
        case XCPanAnimationPresentStyleFromTop: {
            fromTransform = CGAffineTransformMakeTranslation(0, -viewH);
            toTransform   = CGAffineTransformMakeTranslation(0, 0);
            break;
        }
        case XCPanAnimationPresentStyleFromBottom: {
            fromTransform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
            toTransform   = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT-viewH);
            break;
        }
        case XCPanAnimationPresentStyleFromLeft: {
            fromTransform = CGAffineTransformMakeTranslation(-viewW, 0);
            toTransform   = CGAffineTransformMakeTranslation(0, 0);
            break;
        }
        case XCPanAnimationPresentStyleFromRight: {
            fromTransform = CGAffineTransformMakeTranslation(SCREEN_WIDTH, 0);
            toTransform   = CGAffineTransformMakeTranslation(SCREEN_WIDTH-viewW, 0);
            break;
        }
        case XCPanAnimationPresentStyleFromCenter: {
            animationView.frame = CGRectMake((SCREEN_WIDTH-viewW) * 0.5, (SCREEN_HEIGHT-viewH) * 0.5, viewW, viewH);
            fromTransform = CGAffineTransformMakeScale(CGFLOAT_MIN, 1);
            toTransform   = CGAffineTransformMakeTranslation(1, 1);
            break;
        }
    }
    animationView.transform = fromTransform;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animationView.transform = toTransform;
    } completion:^(BOOL finished) {
        [self endAnimation];
    }];
}

/**
 *  dismiss 动画
 */
- (void)dismissAnimation
{
    UIView *animationView    = self.fromView;
    CGSize animationViewSize = self.fromViewController.preferredContentSize;
    
    CGFloat viewW = animationViewSize.width;
    CGFloat viewH = animationViewSize.height;
    
    NSTimeInterval duration = self.duration;
    
    CGAffineTransform transform;
    
    switch (self.presentStyle) {
        case XCPanAnimationPresentStyleFromTop: {
            transform = CGAffineTransformMakeTranslation(0, -viewH);
            break;
        }
        case XCPanAnimationPresentStyleFromBottom: {
            transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
            break;
        }
        case XCPanAnimationPresentStyleFromLeft: {
            transform = CGAffineTransformMakeTranslation(-viewW, 0);
            break;
        }
        case XCPanAnimationPresentStyleFromRight: {
            transform = CGAffineTransformMakeTranslation(SCREEN_WIDTH, 0);
            break;
        }
        case XCPanAnimationPresentStyleFromCenter: {
            transform = CGAffineTransformMakeScale(0.001, 1);
            break;
        }
    }
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animationView.transform = transform;
    } completion:^(BOOL finished) {
        [self endAnimation];
    }];
}

@end
