//
//  UITextView+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "UITextView+XCExtension.h"

#import <objc/objc-runtime.h>

@implementation UITextView (XCExtension)

- (void)addPlaceholerLabel
{
    UILabel *placeHolderLabel      = [[UILabel alloc] init];
    placeHolderLabel.textAlignment = self.textAlignment;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.font          = self.font;
    placeHolderLabel.textColor     = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    self.placeholderLB = placeHolderLabel;
    [self addSubview:placeHolderLabel];
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


- (void)setPlaceholder:(NSString *)placeholder
{
    if (!self.placeholderLB)
    {
        [self addPlaceholerLabel];
    }
    
    self.placeholderLB.text = placeholder;
}


- (NSString *)placeholder
{
    return self.placeholderLB.text;
}



- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if (!self.placeholderLB)
    {
        [self addPlaceholerLabel];
    }
    
    self.placeholderLB.textColor = placeholderColor;
}

- (UIColor *)placeholderColor
{
    return self.placeholderLB.textColor;
}


@end
