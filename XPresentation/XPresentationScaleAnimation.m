//
//  XPresentationScaleAnimation.m
//  XPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：缩放的转场动画 🐾
 */

#import "XPresentationScaleAnimation.h"



@implementation XPresentationScaleAnimation

#pragma mark - 👀 Override 👀 💤

- (void)beginAnimation
{
    switch (self.style)
    {
        case XPresentationAnimationStylePresent:
        {
            [self presentAnimation];
            break;
        }
        case XPresentationAnimationStyleDismiss:
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
    __block UIImageView *imageView = [[UIImageView alloc] initWithImage:self.animationView.image];
    imageView.frame = self.sourceFrame;
    
    self.toView.alpha = 0;
    [self.contaionerView addSubview:self.toView];
    [self.contaionerView addSubview:imageView];
    
    [UIView animateWithDuration:self.duration animations:^{
        
        imageView.frame   = self.destFrame;
        self.toView.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
        
        [imageView removeFromSuperview];
        imageView = nil;
        
        [self endAnimation];
    }];
}

/**
 *  dismiss 动画
 */
- (void)dismissAnimation
{
    __block UIImageView *imageView = [[UIImageView alloc] initWithImage:self.animationView.image];
    
    imageView.frame = self.destFrame;
    
    [self.contaionerView addSubview:self.toView];
    self.toView.alpha = 0;
    
    [self.contaionerView addSubview:imageView];
    
    
    UIImage *image  = [imageView.image copy];
    self.animationView.image = nil;
    
    [UIView animateWithDuration:self.duration animations:^{
        
        imageView.frame   = self.sourceFrame;
        self.toView.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
        
        self.animationView.image = image;
        
        [imageView removeFromSuperview];
        imageView = nil;
        
        [self endAnimation];
    }];
}

@end
