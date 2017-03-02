//
//  UIControl+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (XCExtension)

/**
 *  给 UIControl 添加事件
 *
 *  @param events       事件类型
 *  @param actionHandle  执行事件的回调
 */
- (void)addTargetWithEvents:(UIControlEvents)events
               actionHandle:(void(^)(UIControl *ctl))actionHandle;

@end
