//
//  UIBarButtonItem+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XCExtension)



/**
 *  通过图片名返回一个UIBarButtonItem的实例
 *
 *  @param imgName          普通状态下的图片名
 *  @param clickHandle      事件回调
 *
 */
+ (instancetype)barButtonItemWithImgName:(NSString *)imgName
                             clickHandle:(void(^)())clickHandle;


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
                             clickHandle:(void(^)())clickHandle;


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
                           clickHandle:(void(^)())clickHandle;


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
                           clickHandle:(void(^)())clickHandle;


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
                           clickHandle:(void(^)())clickHandle;



@end



























