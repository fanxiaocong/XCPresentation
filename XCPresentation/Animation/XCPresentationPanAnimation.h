//
//  XCPresentationPanAnimation.h
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：平移动画 🐾
 */


#import "XCPresentationAnimation.h"

typedef NS_ENUM(NSInteger, XCPanAnimationPresentStyle) {
    /// 从顶部弹出
    XCPanAnimationPresentStyleFromTop       = 0,
    /// 从底部弹出
    XCPanAnimationPresentStyleFromBottom,
    /// 从左侧弹出
    XCPanAnimationPresentStyleFromLeft,
    /// 从右侧弹出
    XCPanAnimationPresentStyleFromRight,
    /// 从中间弹出
    XCPanAnimationPresentStyleFromCenter
};

@interface XCPresentationPanAnimation : XCPresentationAnimation

/** 👀 显示的样式 👀 */
@property (assign, nonatomic) XCPanAnimationPresentStyle presentStyle;

@end
