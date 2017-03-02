//
//  UIButton+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "UIButton+XCExtension.h"

#import "UIControl+XCExtension.h"
#import "UIImage+XCExtension.h"

#import <objc/runtime.h>


@interface _XCButtonTarget : NSObject

@property (copy, nonatomic) void(^actionHandle)(UIButton *btn);

- (instancetype)initWithActionHandle:(void(^)(UIButton *btn))actionHandle;
- (void)eventAction:(UIButton *)btn;

@end

@implementation _XCButtonTarget

- (instancetype)initWithActionHandle:(void (^)(UIButton *))actionHandle
{
    if (self = [super init])
    {
        self.actionHandle = [actionHandle copy];
    }
    
    return self;
}

- (void)eventAction:(UIButton *)btn
{
    if (self.actionHandle)
    {
        self.actionHandle(btn);
    }
}

@end

/* 🐖 ***************************** 🐖 华丽的分隔线 🐖 *****************************  🐖 */


@implementation UIButton (XCExtension)

- (void)setHighlightBackgroundColor:(UIColor *)highlightBackgroundColor
{
    objc_setAssociatedObject(self, @selector(highlightBackgroundColor), highlightBackgroundColor, OBJC_ASSOCIATION_ASSIGN);
    
    [self setBackgroundImage:[UIImage imageFromColor:highlightBackgroundColor] forState:UIControlStateHighlighted];
}

- (UIColor *)highlightBackgroundColor
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDisabledBackgroundColor:(UIColor *)disabledBackgroundColor
{
    objc_setAssociatedObject(self, @selector(disabledBackgroundColor), disabledBackgroundColor, OBJC_ASSOCIATION_ASSIGN);
    
    [self setBackgroundImage:[UIImage imageFromColor:disabledBackgroundColor] forState:UIControlStateDisabled];
}

- (UIColor *)disabledBackgroundColor
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor
{
    objc_setAssociatedObject(self, @selector(selectedBackgroundColor), selectedBackgroundColor, OBJC_ASSOCIATION_ASSIGN);
    
    [self setBackgroundImage:[UIImage imageFromColor:selectedBackgroundColor] forState:UIControlStateSelected];
}

- (UIColor *)selectedBackgroundColor
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setClickHandle:(void (^)(UIButton *))clickHandle
{
    [self addTargetWithEvents:UIControlEventTouchUpInside actionHandle:clickHandle];
}

- (void (^)(UIButton *))clickHandle
{
    return [objc_getAssociatedObject(self, _cmd) actionHandle];
}

- (void)addTargetWithEvents:(UIControlEvents)events
               actionHandle:(void (^)(UIButton *))actionHandle
{
    void(^handle)(UIControl *) = (void(^)(UIControl *))actionHandle;
    
    [super addTargetWithEvents:events actionHandle:handle];
}

@end






