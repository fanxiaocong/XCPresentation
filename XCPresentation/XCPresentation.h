//
//  XCPresentationController.h
//  转场动画
//
//  Created by 樊小聪 on 2016/12/28.
//  Copyright © 2016年 樊小聪. All rights reserved.
//



/*
 *  备注：自定义转场方式 🐾
 */



#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger, XCPresentTransitionStyle)
{
    // 中间显示
    XCPresentTransitionStyleCenter = 0,
    
    // 从右往左
    XCPresentTransitionStyleRight,
    
    // 从下往上
    XCPresentTransitionStyleBottom
};

@interface XCPresentation : UIPresentationController


/**
 显示一个 弹框视图控制器

 @param presentedViewController     目标控制器（最终要展示的控制器）
 @param presentingViewController    源控制器（是从哪个控制器推出的）
 @param style                       弹出的模式
 */
+ (void)presentWithPresentedViewController:(UIViewController *)presentedViewController
                  presentingViewController:(UIViewController *)presentingViewController
                              presentStyle:(XCPresentTransitionStyle)style;
@end




































