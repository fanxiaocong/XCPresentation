//
//  XCPresentationBubbleAnimation.m
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

/*
 *  备注：气泡缩放动画 🐾
 */

#import "XCPresentationBubbleAnimation.h"


@interface XCPresentationBubbleAnimation ()<CAAnimationDelegate>

@property (weak, nonatomic) CAShapeLayer *maskLayer;

@end


@implementation XCPresentationBubbleAnimation


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
    [self.contaionerView addSubview:self.fromView];
    [self.contaionerView addSubview:self.toView];
    
    /*⏰ ----- fromView 隐藏的动画 ----- ⏰*/
    
    /// 创建一个 CAShapeLayer 来负责展示圆形遮盖
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.bounds    = self.fromView.layer.bounds;
    maskLayer.position  = self.fromView.layer.position;
    maskLayer.fillColor = self.strokeColor.CGColor ?: self.toView.backgroundColor.CGColor;
    [self.fromView.layer addSublayer:maskLayer];
    self.maskLayer = maskLayer;
    
    /// 开始的圆环
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:self.sourceRect];
    /// 半径
    CGFloat radius = [self radiusOfBubbleInView:self.toView
                                     startPoint:CGPointMake(CGRectGetMidX(self.sourceRect),
                                                            CGRectGetMidY(self.sourceRect))];
    /// 结束的圆环
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.sourceRect, -radius, -radius)];
    
    maskLayer.path = endPath.CGPath;
    
    /// 圆形放大动画
    CABasicAnimation *sourceAnima = [CABasicAnimation animationWithKeyPath:@"path"];
    sourceAnima.fromValue = (__bridge id)(startPath.CGPath);
    sourceAnima.toValue   = (__bridge id)(endPath.CGPath);
    sourceAnima.duration  = self.duration;
    sourceAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    sourceAnima.delegate  = self;
    [maskLayer addAnimation:sourceAnima forKey:NULL];
    
    
    /*⏰ ----- toView 显示的动画 ----- ⏰*/
    /// 目标视图最终显示的位置
    self.toView.layer.position = CGPointMake(CGRectGetMidX(self.toView.bounds), CGRectGetMidY(self.toView.bounds));
    /// 位移与缩放的动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = self.duration;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    /// 位移
    CABasicAnimation *positionAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.sourceRect), CGRectGetMidY(self.sourceRect))];
    positionAnim.toValue   = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.toView.bounds), CGRectGetMidY(self.toView.bounds))];
    /// 缩放
    CABasicAnimation *scaleAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnima.fromValue = @0;
    scaleAnima.toValue   = @1;
    
    group.animations = @[positionAnim, scaleAnima];
    [self.toView.layer addAnimation:group forKey:NULL];
}

/**
 *  dismiss 动画
 */
- (void)dismissAnimation
{
    [self.contaionerView addSubview:self.toView];
    [self.contaionerView addSubview:self.fromView];
    
    /*⏰ ----- toView 显示的动画 ----- ⏰*/
    
    /// 创建一个 CAShapeLayer 来负责展示圆形遮盖
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.bounds    = self.toView.layer.bounds;
    maskLayer.position  = self.toView.layer.position;
    maskLayer.fillColor = self.strokeColor.CGColor ?: self.fromView.backgroundColor.CGColor;
    [self.toView.layer addSublayer:maskLayer];
    self.maskLayer = maskLayer;
    
    /// 半径
    CGFloat radius = [self radiusOfBubbleInView:self.toView startPoint:CGPointMake(CGRectGetMidX(self.sourceRect), CGRectGetMidY(self.sourceRect))];
    /// 开始的圆环
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.sourceRect, -radius, -radius)];
    
    /// 结束的圆环
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:self.sourceRect];
    
    maskLayer.path = endPath.CGPath;
    
    /// 圆形缩小动画
    CABasicAnimation *destAnima = [CABasicAnimation animationWithKeyPath:@"path"];
    destAnima.fromValue = (__bridge id)(startPath.CGPath);
    destAnima.toValue   = (__bridge id)(endPath.CGPath);
    destAnima.duration  = self.duration;
    destAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [maskLayer addAnimation:destAnima forKey:NULL];
    
    
    /*⏰ ----- fromView 隐藏的动画 ----- ⏰*/
    /// fromView 最终的位置
    self.fromView.layer.position = CGPointMake(CGRectGetMidX(self.sourceRect), CGRectGetMidY(self.sourceRect));
    self.fromView.transform = CGAffineTransformMakeScale(0, 0);
    /// 位移与缩放的动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.duration = self.duration;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    /// 位移
    CABasicAnimation *positionAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.fromView.bounds), CGRectGetMidY(self.fromView.bounds))];
    positionAnim.toValue   = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.sourceRect), CGRectGetMidY(self.sourceRect))];
    positionAnim.duration = self.duration;
    /// 缩放
    CABasicAnimation *scaleAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnima.fromValue = @1;
    scaleAnima.toValue   = @0;
    
    group.animations = @[positionAnim, scaleAnima];
    [self.fromView.layer addAnimation:group forKey:NULL];
}

/**
 *  获取 view 的四个顶点 与 startPoint 点之前的最大距离
 *
 *  @param view         视图
 *  @param startPoint   顶点
 */
- (CGFloat)radiusOfBubbleInView:(UIView *)view startPoint:(CGPoint)startPoint
{
    /// 获取 view 上面四个顶点的坐标
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(CGRectGetWidth(view.bounds), 0);
    CGPoint point3 = CGPointMake(0, CGRectGetHeight(view.bounds));
    CGPoint point4 = CGPointMake(CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds));
    
    NSArray *pointsArr = @[[NSValue valueWithCGPoint:point1],
                           [NSValue valueWithCGPoint:point2],
                           [NSValue valueWithCGPoint:point3],
                           [NSValue valueWithCGPoint:point4]];
    
    CGFloat maxRadius = 0;
    
    for (NSValue *value in pointsArr) {
        CGPoint point = value.CGPointValue;
        
        CGFloat deltaX = point.x - startPoint.x;
        CGFloat deltaY = point.y - startPoint.y;
        
        CGFloat radius = sqrt(deltaX * deltaX + deltaY * deltaY);
        
        if (maxRadius < radius) {
            maxRadius = radius;
        }
    }
    
    return maxRadius;
}


#pragma mark - 💉 👀 CAAnimationDelegate 👀

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    // 通知上下文 动画结束
    [self endAnimation];
    
    // 移除遮罩layer
    [_maskLayer removeFromSuperlayer];
    _maskLayer = nil;
}

@end
