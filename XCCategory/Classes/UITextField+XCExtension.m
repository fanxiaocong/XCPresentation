//
//  UITextField+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "UITextField+XCExtension.h"

#import "UIButton+XCExtension.h"
#import "UIControl+XCExtension.h"

#import <objc/objc-runtime.h>

@implementation UITextField (XCExtension)


- (void)addPlaceholerLabel
{
    UILabel *placeHolderLabel      = [[UILabel alloc] init];
    placeHolderLabel.textAlignment = self.textAlignment;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.font          = self.font;
    placeHolderLabel.textColor     = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    self.placeholderLB = placeHolderLabel;
    [self setValue:placeHolderLabel forKeyPath:@"_placeholderLabel"];
}

- (void)setPlaceholderLB:(UILabel *)placeholderLB
{
    if (placeholderLB)
    {
        objc_setAssociatedObject(self, @selector(placeholderLB), placeholderLB, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (UILabel *)placeholderLB
{
    return objc_getAssociatedObject(self, _cmd);
}


/**
 设置 placeholder
 */
- (void)setPlaceholder:(NSString *)placeholder
{
    if (!self.placeholderLB)
    {
        [self addPlaceholerLabel];
    }
    
    self.placeholderLB.text = placeholder;
}


/**
 返回 placeholder
 */
- (NSString *)placeholder
{
    return self.placeholderLB.text;
}


/**
 设置 placeholder 的颜色
 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if (!self.placeholderLB)
    {
        [self addPlaceholerLabel];
    }
    
    self.placeholderLB.textColor = placeholderColor;
}


/**
 返回placeholder文字的颜色
 */
- (UIColor *)placeholderColor
{
    return self.placeholderLB.textColor;
}


/**
 返回字数输入的最大字数
 */
- (NSInteger)maxTextCount
{
    NSNumber *maxCount = objc_getAssociatedObject(self, _cmd);
    
    return maxCount.integerValue;
}





/**
 设置输入的最大字数
 */
- (void)setMaxTextCount:(NSInteger)maxTextCount
{
    objc_setAssociatedObject(self, @selector(maxTextCount), @(maxTextCount), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!maxTextCount)      return;
    
    
    __block typeof(self)ws = self;
    
    
    // 添加事件：文字改变时调用
    [self addTargetWithEvents:UIControlEventEditingChanged actionHandle:^(UIControl *ctl) {
        [ws textFTextDidChange];
    }];
}

// 文字发生改变
- (void)textFTextDidChange
{
    if (self.maxTextCount && self.text.length > self.maxTextCount && self.markedTextRange == nil)
    {
        self.text = [self.text substringWithRange: NSMakeRange(0, self.maxTextCount + 1)];
        
        [self deleteBackward];
    }
    
    if (self.textDidChange)
    {
        self.textDidChange(self, self.text);
    }
}

- (void)setTextDidChange:(void (^)(UITextField *, NSString *))textDidChange
{
    objc_setAssociatedObject(self, @selector(textDidChange), textDidChange, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITextField *, NSString *))textDidChange
{
    return objc_getAssociatedObject(self, _cmd);
}




- (void)setOverMaxCountPlaceholder:(NSString *)overMaxCountPlaceholder
{
    if (!overMaxCountPlaceholder.length)        return;
    
    objc_setAssociatedObject(self, @selector(overMaxCountPlaceholder), overMaxCountPlaceholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)overMaxCountPlaceholder
{
    return objc_getAssociatedObject(self, _cmd);
}


/**
 设置 右侧清空按钮的图片的名称
 
 */
- (void)setClearButtonImgName:(NSString *)clearButtonImgName
{
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    clearButton.frame = CGRectMake(0, 0, 20, 20);
    [clearButton setImage:[UIImage imageNamed:clearButtonImgName] forState:UIControlStateNormal];
    [clearButton setImage:[UIImage imageNamed:clearButtonImgName] forState:UIControlStateHighlighted];
    
    __block typeof(self)ws = self;
    
    // 点击了清空按钮
    clearButton.clickHandle = ^(UIButton *btn){
        
        if (ws.isFirstResponder)
        {
            ws.text = NULL;
        }
    };
    
    [self setValue:clearButton forKey:@"clearButton"];
    
    objc_setAssociatedObject(self, @selector(clearButtonImgName), clearButtonImgName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)clearButtonImgName
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
