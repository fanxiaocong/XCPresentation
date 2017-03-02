//
//  CALayer+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (XCExtension)


/** key path "tranform.rotation" */
@property (nonatomic) CGFloat transformRotation;

/** key path "tranform.rotation.x" */
@property (nonatomic) CGFloat transformRotationX;

/** key path "tranform.rotation.y" */
@property (nonatomic) CGFloat transformRotationY;

/** key path "tranform.rotation.z" */
@property (nonatomic) CGFloat transformRotationZ;

/** key path "tranform.scale" */
@property (nonatomic) CGFloat transformScale;

/** key path "tranform.scale.x" */
@property (nonatomic) CGFloat transformScaleX;

/** key path "tranform.scale.y" */
@property (nonatomic) CGFloat transformScaleY;

/** key path "tranform.scale.z" */
@property (nonatomic) CGFloat transformScaleZ;

/** key path "tranform.translation.x" */
@property (nonatomic) CGFloat transformTranslationX;

/** key path "tranform.translation.y" */
@property (nonatomic) CGFloat transformTranslationY;

/** key path "tranform.translation.z" */
@property (nonatomic) CGFloat transformTranslationZ;

/**
 Shortcut for transform.m34, -1/1000 is a good value.
 It should be set before other transform shortcut.
 */
@property (nonatomic) CGFloat transformDepth;

/**
 *  Wrapper for `contentsGravity` property.// 停靠模式
 */
@property (nonatomic) UIViewContentMode contentMode;

/**
 Add a fade animation to layer's contents when the contents is changed.
 
 @param duration 动画类型
 @param curve    动画运动的轨迹.
 */
- (void)addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve;

/** 移除动画 */
- (void)removePreviousFadeAnimation;



@end
