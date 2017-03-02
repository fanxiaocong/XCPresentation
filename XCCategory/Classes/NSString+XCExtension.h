//
//  NSString+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XCExtension)

/**
 *  返回 当前设备的 UUID
 */
+ (NSString *)stringWithUUID;

/**
 *  返回当前设备连接的 IP地址
 */
+ (NSString *)stringWithIP;

@end
