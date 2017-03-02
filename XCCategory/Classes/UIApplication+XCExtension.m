//
//  UIApplication+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：关于 App 信息的分类 🐾
 */


#import "UIApplication+XCExtension.h"

@implementation UIApplication (XCExtension)

/** 👀 沙盒中 Documents 的全路径 👀 */
- (NSString *)documentsPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

/** 👀 沙盒中 Caches 的全路径 👀 */
- (NSString *)cachesPath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

/** 👀 沙盒中 Library 的全路径 👀 */
- (NSString *)libraryPath
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

/** 👀 App 的 BundleName 👀 */
- (NSString *)appBundleName
{
    return [self fetchAppBundleInfoValueForKey:@"CFBundleName"];
}

/** 👀 App 的 BundleID 👀 */
- (NSString *)appBundleID
{
    return [self fetchAppBundleInfoValueForKey:@"CFBundleIdentifier"];
}

/** 👀 App 的 BundelVersion(Build 版本号) 👀 */
- (NSString *)appBundleVersion
{
    return [self fetchAppBundleInfoValueForKey:@""];
}

/** 👀 App 的 appBundleShortVersion(Version 版本号) 👀 */
- (NSString *)appBundleShortVersion
{
    return [self fetchAppBundleInfoValueForKey:@"CFBundleShortVersionString "];
}

/** 👀 App 展示的名称 👀 */
- (NSString *)appDisplayName
{
    return [self fetchAppBundleInfoValueForKey:@"CFBundleDisplayName"];
}



/**
 获取 App 相关的信息

 @param key Key 值
 */
- (NSString *)fetchAppBundleInfoValueForKey:(NSString *)key
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:key];
}

@end








































