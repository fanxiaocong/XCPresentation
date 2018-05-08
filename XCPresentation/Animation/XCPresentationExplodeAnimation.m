//
//  XCPresentationExplodeAnimation.m
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注： 分裂动画 🐾
 */


#import "XCPresentationExplodeAnimation.h"

@implementation XCPresentationExplodeAnimation

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
    self.duration = 1.5;
}


#pragma mark - 👀 Override 👀 💤

- (void)beginAnimation
{
    BOOL afterScreenUpdates = NO;
    
    if (@available(iOS 10.0, *)) {
        afterScreenUpdates = YES;
    }
    
    [self.contaionerView addSubview:self.toView];
    [self.contaionerView sendSubviewToBack:self.toView];
    
    CGSize size = self.toView.frame.size;
    
    NSMutableArray *snapshots = [NSMutableArray new];
    
    CGFloat xFactor = 10.0f;
    CGFloat yFactor = xFactor * size.height / size.width;
    
    UIView *fromViewSnapshot = [self.fromView snapshotViewAfterScreenUpdates:NO];
    
    for (CGFloat x=0; x < size.width; x+= size.width / xFactor)
    {
        for (CGFloat y=0; y < size.height; y+= size.height / yFactor)
        {
            CGRect snapshotRegion = CGRectMake(x, y, size.width / xFactor, size.height / yFactor);
            UIView *snapshot = [fromViewSnapshot resizableSnapshotViewFromRect:snapshotRegion  afterScreenUpdates:afterScreenUpdates withCapInsets:UIEdgeInsetsZero];
            snapshot.frame = snapshotRegion;
            [self.contaionerView addSubview:snapshot];
            [snapshots addObject:snapshot];
        }
    }
    
    [self.contaionerView sendSubviewToBack:self.fromView];
    
    [UIView animateWithDuration:self.duration animations:^{
        for (UIView *view in snapshots)
        {
            CGFloat xOffset = [self randomFloatBetween:-100.0 and:100.0];
            CGFloat yOffset = [self randomFloatBetween:-100.0 and:100.0];
            view.frame = CGRectOffset(view.frame, xOffset, yOffset);
            view.alpha = 0.0;
            view.transform = CGAffineTransformScale(CGAffineTransformMakeRotation([self randomFloatBetween:-10.0 and:10.0]), 0.01, 0.01);
        }
    } completion:^(BOOL finished) {
        for (UIView *view in snapshots)
        {
            [view removeFromSuperview];
        }
        
        [self endAnimation];
    }];
}

#pragma mark - 🔒 👀 Privite Method 👀

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber
{
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}


@end
