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


typedef NS_ENUM(NSInteger, AlertAnimationPresentStyle)
{
    AlertAnimationPresentStyleFromLeft = 0,
    
    AlertAnimationPresentStyleFromRight,
    
    AlertAnimationPresentStyleFromTop,
    
    AlertAnimationPresentStyleFromBottom,
    
    AlertAnimationPresentStyleFromCenter
};

typedef NS_ENUM(NSInteger, AlertAnimationDismissStyle)
{
    AlertAnimationDismissStyleToLeft = 0,
    
    AlertAnimationDismissStyleToRight,
    
    AlertAnimationDismissStyleToTop,
    
    AlertAnimationDismissStyleToBottom,
    
    AlertAnimationDismissStyleToCenter
};


@interface XCPresentationAlertAnimation : XCPresentationAnimation

/** 👀 显示的样式 👀 */
@property (assign, nonatomic) AlertAnimationPresentStyle presentStyle;
/** 👀 隐藏的样式 👀 */
@property (assign, nonatomic) AlertAnimationDismissStyle dismissStyle;
/** 👀 伸缩幅度：默认 0.5 (对于 AlertAnimationPresentStyleFromCenter 无效) 👀 */
@property (assign, nonatomic) CGFloat springDamping;

@end
