//
//  UIControl+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "UIControl+XCExtension.h"
#import <objc/runtime.h>


@interface _XCControlTarget : NSObject

@property (copy, nonatomic) void(^actionHandle)(UIControl *ctl);

- (instancetype)initWithActionHandle:(void(^)(UIControl *ctl))actionHandle;

- (void)eventAction:(UIControl *)ctl;

@end


@implementation _XCControlTarget

- (instancetype)initWithActionHandle:(void (^)(UIControl *))actionHandle
{
    if (self = [super init])
    {
        self.actionHandle = [actionHandle copy];
    }
    
    return self;
}

- (void)eventAction:(UIControl *)ctl
{
    if (self.actionHandle)
    {
        self.actionHandle(ctl);
    }
}

@end

/* 🐖 ***************************** 🐖 华丽的分隔线 🐖 *****************************  🐖 */

static char ch;


@implementation UIControl (XCExtension)

/**
 *  给 UIControl 添加事件
 *
 *  @param events       事件类型
 *  @param actionHandle  执行事件的回调
 */
- (void)addTargetWithEvents:(UIControlEvents)events
               actionHandle:(void(^)(UIControl *ctl))actionHandle
{
    
    _XCControlTarget *target = [[_XCControlTarget alloc] initWithActionHandle:actionHandle];
    
    objc_setAssociatedObject(self, &ch, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTarget:target action:@selector(eventAction:) forControlEvents:events];
}


@end
