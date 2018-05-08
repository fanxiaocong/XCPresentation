//
//  XCPresentationAlertAnimation.m
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//



/*
 *  备注：弹框动画 🐾
 */


#import "XCPresentationAlertAnimation.h"


#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height


@implementation XCPresentationAlertAnimation

- (instancetype)init
{
    if (self = [super init])
    {
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
    self.duration      = .75f;
    _springDamping     = .5f;
    _presentStyle      = AlertAnimationPresentStyleFromCenter;
    _dismissStyle      = AlertAnimationDismissStyleToCenter;
}


#pragma mark - 👀 Override 👀 💤

- (void)beginAnimation
{
    switch (self.style)
    {
        case XCPresentationAnimationStylePresent:
        {
            [self presentAnimation];
            break;
        }
        case XCPresentationAnimationStyleDismiss:
        {
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
    
    CGRect fromFrame, toFrame;
    
    CGFloat viewW = animationViewSize.width;
    CGFloat viewH = animationViewSize.height;
    
    /// 初始化视图 frame
    fromFrame = CGRectMake(0, 0, viewW, viewH);
    toFrame   = CGRectMake((SCREEN_WIDTH-viewW)*0.5, (SCREEN_HEIGHT-viewH)*0.5, viewW, viewH);
    
    switch (self.presentStyle)
    {
        case AlertAnimationPresentStyleFromTop:
        {
            fromFrame.origin.y = -viewH;
            fromFrame.origin.x = (SCREEN_WIDTH-viewW) * 0.5;
            break;
        }
        case AlertAnimationPresentStyleFromBottom:
        {
            fromFrame.origin.y = SCREEN_HEIGHT;
            fromFrame.origin.x = (SCREEN_WIDTH-viewW) * 0.5;
            break;
        }
        case AlertAnimationPresentStyleFromLeft:
        {
            fromFrame.origin.y = (SCREEN_HEIGHT-viewH) * 0.5;
            fromFrame.origin.x = -viewW;
            break;
        }
        case AlertAnimationPresentStyleFromRight:
        {
            fromFrame.origin.y = (SCREEN_HEIGHT-viewH) * 0.5;
            fromFrame.origin.x = SCREEN_WIDTH;
            break;
        }
        case AlertAnimationPresentStyleFromCenter:
        {
            fromFrame.origin.y = (SCREEN_HEIGHT-viewH) * 0.5;
            fromFrame.origin.x = (SCREEN_WIDTH-viewW) * 0.5;
            self.duration      = .25f;
            break;
        }
    }
    
    
    animationView.frame = fromFrame;
    
    if (self.presentStyle == AlertAnimationPresentStyleFromCenter)
    {
        animationView.alpha = 0.f;
        animationView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        [UIView animateWithDuration:self.duration animations:^{
            
            animationView.alpha = 1;
            animationView.transform = CGAffineTransformMakeScale(1.f, 1.f);
            
        } completion:^(BOOL finished) {
            
            // 通知上下文 动画结束
            [self endAnimation];
        }];
    }
    else
    {
        /// 开始动画
        [UIView animateWithDuration:self.duration delay:0.f usingSpringWithDamping:self.springDamping initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            animationView.frame = toFrame;
            
        } completion:^(BOOL finished) {
            
            // 通知上下文 动画结束
            [self endAnimation];
        }];
    }
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
    
    NSTimeInterval duration = self.duration * 0.7;
    
    /// 初始化视图 frame
    CGRect toFrame = CGRectMake(0, 0, viewW, viewH);
        
    switch (self.dismissStyle)
    {
        case AlertAnimationDismissStyleToTop:
        {
            toFrame.origin.y = -viewH;
            toFrame.origin.x = (SCREEN_WIDTH-viewW) * 0.5;
            break;
        }
        case AlertAnimationDismissStyleToBottom:
        {
            toFrame.origin.y = SCREEN_HEIGHT;
            toFrame.origin.x = (SCREEN_WIDTH-viewW) * 0.5;
            break;
        }
        case AlertAnimationDismissStyleToLeft:
        {
            toFrame.origin.y = (SCREEN_HEIGHT-viewH) * 0.5;
            toFrame.origin.x = -viewW;
            break;
        }
        case AlertAnimationDismissStyleToRight:
        {
            toFrame.origin.y = (SCREEN_HEIGHT-viewH) * 0.5;
            toFrame.origin.x = SCREEN_WIDTH;
            break;
        }
        case AlertAnimationDismissStyleToCenter:
        {
            toFrame.origin.y = (SCREEN_HEIGHT-viewH) * 0.5;
            toFrame.origin.x = (SCREEN_WIDTH-viewW) * 0.5;
            duration = .25f;
            break;
        }
    }
    
    if (self.dismissStyle == AlertAnimationDismissStyleToCenter)
    {
        [UIView animateWithDuration:duration animations:^{
            
            animationView.alpha = 0.f;
            
        } completion:^(BOOL finished) {
            
            // 通知上下文 动画结束
            [self endAnimation];
        }];
    }
    else
    {
        /// 开始动画
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            animationView.frame = toFrame;
            
        } completion:^(BOOL finished) {
            
            // 通知上下文 动画结束
            [self endAnimation];
        }];
    }
}


@end
