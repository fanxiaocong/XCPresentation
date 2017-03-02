//
//  NSAttributedString+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (XCExtension)


#pragma mark - 👀 行间距 👀 💤

/**
 *  给属性字符串添加行间距(文字颜色为黑色)
 *
 *  @param string    文字
 *  @param fontSize  文字大小
 *  @param lineSpace 行间距
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                                  fontSize:(CGFloat)fontSize
                                 lineSpace:(CGFloat)lineSpace;

/**
 *  给属性字符串添加行间距
 *
 *  @param string    文字
 *  @param textColor 文字颜色
 *  @param fontSize  文字大小
 *  @param lineSpace 行间距
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                                 textColor:(UIColor *)textColor
                                  fontSize:(CGFloat)fontSize
                                 lineSpace:(CGFloat)lineSpace;


#pragma mark - 👀 图文混排 👀 💤

/**
 *  图文混排（文字在前面，图片在后面）
 *
 *  @param text         文字
 *  @param fontSize     文字的大小
 *  @param textColor    文字的颜色
 *  @param imgName      图片的名字
 *  @param imgSize      图片的尺寸
 *
 *  @return 返回一个已经设置好文字和图片的attributedString
 */
+ (instancetype)attributedStringWithText:(NSString *)text
                                fontSize:(CGFloat)fontSize
                               textColor:(UIColor *)textColor
                               imageName:(NSString *)imgName
                                 imgSize:(CGSize)imgSize;

/**
 *  图文混排（文字在前面，图片在后面）
 *
 *  @param text         文字
 *  @param fontSize     文字的大小
 *  @param textColor    文字的颜色
 *  @param imgName      图片的名字
 *  @param imgSize      图片的尺寸
 *  @param imgPosition  图片的位置
 *
 *  @return 返回一个已经设置好文字和图片的attributedString
 */
+ (instancetype)attributedStringWithText:(NSString *)text
                                fontSize:(CGFloat)fontSize
                               textColor:(UIColor *)textColor
                               imageName:(NSString *)imgName
                                 imgSize:(CGSize)imgSize
                             imgPosition:(CGPoint)imgPosition;


/**
 *  图文混排 （图片在前面，文字在后面）
 *
 *  @param imgName      图片的名称
 *  @param imgSize      图片的大小
 *  @param text         文字
 *  @param fontSize     文字的大小
 *  @param textColor    文字的颜色
 *
 *  @return 返回一个已经设置好图片和文字的attributedString
 */
+ (instancetype)attributedStringWithImageName:(NSString *)imgName
                                      imgSize:(CGSize)imgSize
                                         text:(NSString *)text
                                     fontSize:(CGFloat)fontSize
                                    textColor:(UIColor *)textColor;

/**
 *  图文混排 （图片在前面，文字在后面）
 *
 *  @param imgName      图片的名称
 *  @param imgSize      图片的大小
 *  @param text         文字
 *  @param fontSize     文字的大小
 *  @param textColor    文字的颜色
 *  @param imgPosition  图片的位置
 *
 *  @return 返回一个已经设置好图片和文字的attributedString
 */
+ (instancetype)attributedStringWithImageName:(NSString *)imgName
                                      imgSize:(CGSize)imgSize
                                         text:(NSString *)text
                                     fontSize:(CGFloat)fontSize
                                    textColor:(UIColor *)textColor
                                  imgPosition:(CGPoint)imgPosition;


#pragma mark - 👀 下划线 👀 💤

/**
 *  给attributedString添加下划线(满格下划线 下划线的颜色为黑色)
 *
 *  @param string                      文字
 *  @param textColor                   文字颜色
 *  @param fontSize                    文字大小
 *
 *  @return 返回一个已经设置好删除线的attributedString
 */
+ (instancetype)attributedStringOfUnderlineWithString:(NSString *)string
                                            textColor:(UIColor *)textColor
                                             fontSize:(CGFloat)fontSize;


/**
 *  给attributedString添加下划线(满格下划线 自定义下划线的颜色)
 *
 *  @param string                      文字
 *  @param textColor                   文字颜色
 *  @param fontSize                    文字大小
 *  @param underlineColor              下划线的颜色
 *
 *  @return 返回一个已经设置好删除线的attributedString
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                                 textColor:(UIColor *)textColor
                                  fontSize:(CGFloat)fontSize
                            underlineColor:(UIColor *)underlineColor;


/**
 *  给attributedString添加下划线(自定义下划线范围 下划线的颜色)
 *
 *  @param string                      文字
 *  @param textColor                   文字颜色
 *  @param fontSize                    文字大小
 *  @param underlineText               要加入下划线的文字
 *  @param underlineColor              下划线的颜色
 *
 *  @return 返回一个已经设置好删除线的attributedString
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                                 textColor:(UIColor *)textColor
                                  fontSize:(CGFloat)fontSize
                             underlineText:(NSString *)underlineText
                            underlineColor:(UIColor *)underlineColor;

/**
 *  给attributedString添加下划线(自定义下划线范围 自定义下划线的颜色 自定义下划线文字的大小 颜色)
 *
 *  @param string                      文字
 *  @param textColor                   文字颜色
 *  @param fontSize                    文字大小
 *  @param underlineText               要加入下划线的文字
 *  @param underlineTextFontSize       要加入下划线的文字的大小
 *  @param underlineTextColor          要加入下划线的文字的颜色
 *  @param underlineColor              下划线的颜色
 *
 *  @return 返回一个已经设置好删除线的attributedString
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                                 textColor:(UIColor *)textColor
                                  fontSize:(CGFloat)fontSize
                             underlineText:(NSString *)underlineText
                     underlineTextFontSize:(CGFloat)underlineTextFontSize
                        underlineTextColor:(UIColor *)underlineTextColor
                            underlineColor:(UIColor *)underlineColor;


#pragma mark - 👀 删除线 👀 💤

/**
 *  给attributedString添加删除线(满格删除 删除线的颜色为黑色)
 *
 *  @param string                      文字
 *  @param textColor                   文字颜色
 *  @param fontSize                    文字大小
 *
 *  @return 返回一个已经设置好删除线的attributedString
 */
+ (instancetype)attributedStringOfStrikethroughWithString:(NSString *)string
                                                textColor:(UIColor *)textColor
                                                 fontSize:(CGFloat)fontSize;


/**
 *  给attributedString添加删除线(满格删除 自定义删除线的颜色)
 *
 *  @param string                      文字
 *  @param textColor                   文字颜色
 *  @param fontSize                    文字大小
 *  @param strikethroughLineColor      删除线的颜色
 *
 *  @return 返回一个已经设置好删除线的attributedString
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                                 textColor:(UIColor *)textColor
                                  fontSize:(CGFloat)fontSize
                    strikethroughLineColor:(UIColor *)strikethroughLineColor;


/**
 *  给attributedString添加删除线(自定义删除范围 自定义删除线的颜色)
 *
 *  @param string                      文字
 *  @param textColor                   文字颜色
 *  @param fontSize                    文字大小
 *  @param strikethroughText           要加入删除线的文字
 *  @param strikethroughLineColor      删除线的颜色
 *
 *  @return 返回一个已经设置好删除线的attributedString
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                                 textColor:(UIColor *)textColor
                                  fontSize:(CGFloat)fontSize
                         strikethroughText:(NSString *)strikethroughText
                    strikethroughLineColor:(UIColor *)strikethroughLineColor;


/**
 *  给attributedString添加删除线(自定义删除范围 自定义删除线的颜色 自定义删除线文字的大小 颜色)
 *
 *  @param string                      文字
 *  @param textColor                   文字颜色
 *  @param fontSize                    文字大小
 *  @param strikethroughText           要加入删除线的文字
 *  @param strikethroughTextFontSize   要加入删除线的文字的大小
 *  @param strikethroughTextColor      要加入删除线的文字的颜色
 *  @param strikethroughLineColor      删除线的颜色
 *
 *  @return 返回一个已经设置好删除线的attributedString
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                                 textColor:(UIColor *)textColor
                                  fontSize:(CGFloat)fontSize
                         strikethroughText:(NSString *)strikethroughText
                 strikethroughTextFontSize:(CGFloat)strikethroughTextFontSize
                    strikethroughTextColor:(UIColor *)strikethroughTextColor
                    strikethroughLineColor:(UIColor *)strikethroughLineColor;

@end
































