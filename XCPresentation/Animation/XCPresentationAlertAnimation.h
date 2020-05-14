//
//  XCPresentationAlertAnimation.h
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：弹框动画 🐾
 */

#import "XCPresentationAnimation.h"

/**
 *  显示的样式
 */
typedef NS_ENUM(NSInteger, XCAlertAnimationPresentStyle) {
    /// 从左侧弹出
    XCAlertAnimationPresentStyleFromLeft = 0,
    /// 从右侧弹出
    XCAlertAnimationPresentStyleFromRight,
    /// 从顶部弹出
    XCAlertAnimationPresentStyleFromTop,
    /// 从底部弹出
    XCAlertAnimationPresentStyleFromBottom,
    /// 从中间弹出
    XCAlertAnimationPresentStyleFromCenter
};

/**
 *  消失的样式
 */
typedef NS_ENUM(NSInteger, XCAlertAnimationDismissStyle) {
    /// 到左侧消失
    XCAlertAnimationDismissStyleToLeft = 0,
    /// 到右侧消失
    XCAlertAnimationDismissStyleToRight,
    /// 到顶部消失
    XCAlertAnimationDismissStyleToTop,
    /// 到底部消失
    XCAlertAnimationDismissStyleToBottom,
    /// 到中间消失
    XCAlertAnimationDismissStyleToCenter
};


@interface XCPresentationAlertAnimation : XCPresentationAnimation

/** 👀 显示的样式 👀 */
@property (assign, nonatomic) XCAlertAnimationPresentStyle presentStyle;
/** 👀 隐藏的样式 👀 */
@property (assign, nonatomic) XCAlertAnimationDismissStyle dismissStyle;
/** 👀 伸缩幅度：默认 0.5 (对于 AlertAnimationPresentStyleFromCenter 无效) 👀 */
@property (assign, nonatomic) CGFloat springDamping;

@end
