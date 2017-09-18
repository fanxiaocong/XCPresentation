//
//  XCPresentation.h
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：自定义 Model 方式 🐾
 */


#import <UIKit/UIKit.h>
#import "XCPresentationAnimation.h"

@interface XCPresentation : UIPresentationController

/**
 *  显示一个 弹框视图控制器
 *
 *  @param presentationAnimation    动画类
 *  @param presentedViewController  目标控制器（最终要展示的控制器）
 *  @param presentingViewController 源控制器（是从哪个控制器推出的
 */
+ (void)presentWithPresentationAnimation:(XCPresentationAnimation *)presentationAnimation
                 presentedViewController:(UIViewController *)presentedViewController
                presentingViewController:(UIViewController *)presentingViewController;

@end
