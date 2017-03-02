//
//  UITextView+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface UITextView (XCExtension)

/** 👀 placeholder的文字 👀 */
@property (copy, nonatomic) IBInspectable NSString *placeholder;

/** 👀 placeholder文字的颜色 👀 */
@property (weak, nonatomic) IBInspectable UIColor *placeholderColor;

@end
