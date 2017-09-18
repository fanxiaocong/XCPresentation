//
//  XPresentationScaleAnimation.h
//  XPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：缩放的转场动画 🐾
 */

#import "XPresentationAnimation.h"

@interface XPresentationScaleAnimation : XPresentationAnimation

/** 👀 要进行动画的 imageView 👀 */
@property (weak, nonatomic) UIImageView *animationView;
/** 👀 动画视图动画之前的 frame  👀 */
@property (assign, nonatomic) CGRect sourceFrame;
/** 👀 动画视图动画之后的 frame 👀 */
@property (assign, nonatomic) CGRect destFrame;

@end
