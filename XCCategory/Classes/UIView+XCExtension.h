//
//  UIView+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (XCExtension)

/** 👀 边框圆角半径 👀 */
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
/** 👀 边框宽度 👀 */
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
/** 👀 边框颜色 👀 */
@property (weak, nonatomic) IBInspectable UIColor *borderColor;


/* 🐖 ***************************** 🐖 华丽的分隔线 🐖 *****************************  🐖 */

/** frame.origin.x */
@property (nonatomic) CGFloat left;

/** frame.origin.y */
@property (nonatomic) CGFloat top;

/** frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat right;

/** frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat bottom;

/** frame.size.width */
@property (nonatomic) CGFloat width;

/** frame.size.height */
@property (nonatomic) CGFloat height;

/** center.x */
@property (nonatomic) CGFloat centerX;

/** center.y */
@property (nonatomic) CGFloat centerY;

/** frame.origin */
@property (nonatomic) CGPoint origin;

/** frame.origin.size */
@property (nonatomic) CGSize size;


/* 🐖 ***************************** 🐖 华丽的分隔线 🐖 *****************************  🐖 */

/** 👀 当前视图的截图 👀 */
@property (strong, nonatomic, readonly) UIImage *snapshotImage;


@end




















