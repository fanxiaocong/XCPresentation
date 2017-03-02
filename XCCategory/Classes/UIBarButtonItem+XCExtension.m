//
//  UIBarButtonItem+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "UIBarButtonItem+XCExtension.h"

#import "UIButton+XCExtension.h"

@implementation UIBarButtonItem (XCExtension)

/**
 *  通过 文字和图片返回一个UIBarButtonItem的实例
 *
 *  @param title            文字
 *  @param titleColor       文字普通状态下的颜色
 *  @param hightlightColor  文字高亮状态下的颜色
 *  @param fonSize          文字大小
 *  @param imgName          图片普通状态下的图片名称
 *  @param highlightImgName 图片高亮状态下的图片名称
 *  @param clickHandle      点击事件回调
 */
+ (instancetype)barButtonItemWithTitle:(NSString *)title
                            titleColor:(UIColor *)titleColor
                       hightlightColor:(UIColor *)hightlightColor
                              fontSize:(CGFloat)fonSize
                               imgName:(NSString *)imgName
                      highlightImgName:(NSString *)highlightImgName
                           clickHandle:(void(^)())clickHandle
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title)
    {
        btn.titleLabel.font = [UIFont systemFontOfSize:fonSize];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        [btn setTitleColor:hightlightColor forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    }
    
    if (imgName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    
    if (highlightImgName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:highlightImgName] forState:UIControlStateHighlighted];
    }
    
    [btn sizeToFit];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    btn.clickHandle = ^(UIButton *btn){
        
        if (clickHandle)
        {
            clickHandle();
        }
    };
    
    return item;
}

/**
 *  通过一个文字返回一个UIBarButtonItem的实例
 *
 *  @param title           文字
 *  @param titleColor      文字普通状态下的颜色
 *  @param hightlightColor 文字高亮状态下的颜色
 *  @param fontSize        文字大小
 *  @param clickHandle     事件回调
 *
 */
+ (instancetype)barButtonItemWithTitle:(NSString *)title
                            titleColor:(UIColor *)titleColor
                       hightlightColor:(UIColor *)hightlightColor
                              fontSize:(CGFloat)fontSize
                           clickHandle:(void(^)())clickHandle
{
    return [self barButtonItemWithTitle:title
                             titleColor:titleColor
                        hightlightColor:hightlightColor
                               fontSize:fontSize
                                imgName:nil
                       highlightImgName:nil
                            clickHandle:clickHandle];
}

/**
 *  通过一个文字返回一个UIBarButtonItem的实例
 *
 *  @param title           文字
 *  @param titleColor      文字普通状态下的颜色
 *  @param fontSize        文字大小
 *  @param clickHandle     事件回调
 *
 */
+ (instancetype)barButtonItemWithTitle:(NSString *)title
                            titleColor:(UIColor *)titleColor
                              fontSize:(CGFloat)fontSize
                           clickHandle:(void(^)())clickHandle
{
    return [self barButtonItemWithTitle:title
                             titleColor:titleColor
                        hightlightColor:[titleColor
                                         colorWithAlphaComponent:.5f]
                               fontSize:fontSize
                            clickHandle:clickHandle];
}

/**
 *  通过图片名返回一个UIBarButtonItem的实例
 *
 *  @param imgName          普通状态下的图片名
 *  @param highlightImgName 高亮状态下的图片名
 *  @param clickHandle      事件回调
 *
 */
+ (instancetype)barButtonItemWithImgName:(NSString *)imgName
                        highlightImgName:(NSString *)highlightImgName
                             clickHandle:(void(^)())clickHandle
{
    return [self barButtonItemWithTitle:NULL
                             titleColor:NULL
                        hightlightColor:NULL
                               fontSize:HUGE
                                imgName:imgName
                       highlightImgName:highlightImgName
                            clickHandle:clickHandle];
}


/**
 *  通过图片名返回一个UIBarButtonItem的实例
 *
 *  @param imgName          普通状态下的图片名
 *  @param clickHandle      事件回调
 *
 */
+ (instancetype)barButtonItemWithImgName:(NSString *)imgName
                             clickHandle:(void(^)())clickHandle
{
    return [self barButtonItemWithImgName:imgName
                         highlightImgName:NULL
                              clickHandle:clickHandle];
}

@end










