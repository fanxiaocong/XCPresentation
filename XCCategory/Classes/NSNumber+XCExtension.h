//
//  NSNumber+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (XCExtension)

/** 将 NSString 转化为 NSNumber */
+ (instancetype)numberWithString:(NSString *)string;

@end
