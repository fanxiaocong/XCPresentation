//
//  UITextField+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface UITextField (XCExtension)

/** 👀  placeholder 文字 👀 */
@property (copy, nonatomic) IBInspectable NSString *placeholder;

/** 👀 placeholder 文字的颜色 👀 */
@property (weak, nonatomic) IBInspectable UIColor *placeholderColor;

/**
 *  最大输入的字数
 */
@property (assign, nonatomic) IBInspectable NSInteger maxTextCount;

/** 👀 超过最大输入的提示语 👀 */
@property (copy, nonatomic) IBInspectable NSString *overMaxCountPlaceholder;

/** 👀 右侧清空按钮的图片名称 👀 */
@property (strong, nonatomic) IBInspectable NSString *clearButtonImgName;

/** 👀 文字发生改变的时候回调 👀 */
@property (copy, nonatomic) void(^textDidChange)(UITextField *textField, NSString *text);

@end
