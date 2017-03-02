//
//  UIBezierPath+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (XCExtension)

/**
 *  根据 字符串 和 字体，返回一个 贝赛尔曲线
 *
 *  @param text 要绘制的字符串
 *  @param font 字体
 *
 */
+ (UIBezierPath *)bezierPathWithText:(NSString * )text
                                font:(UIFont *)font;

@end
