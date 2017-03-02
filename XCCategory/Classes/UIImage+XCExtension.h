//
//  UIImage+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XCExtension)


/**
 *  返回一个已经截好图的图片
 *
 *  @param captureView    需要截图view
 *  @return 返回view的图片
 */
+ (UIImage *)imageFromCaptureView:(UIView *)captureView;

/**
 获取当前屏幕的图片的截图
 */
+ (UIImage *)imageFromScreen;

/**
 *  根据验证码生成二维码图片
 *
 *  @param code 验证码
 *
 */
+ (UIImage *)imageFromQRCode:(NSString *)code;


/**
 获取对应颜色的图片
 */
+ (UIImage *)imageFromColor:(UIColor *)color frame:(CGRect)frame;
+ (UIImage *)imageFromColor:(UIColor *)color;


/* 🐖 ***************************** 🐖 Effect 🐖 *****************************  🐖 */


- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;


@end
