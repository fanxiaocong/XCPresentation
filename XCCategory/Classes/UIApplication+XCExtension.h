//
//  UIApplication+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：关于 App 信息的分类 🐾
 */


#import <UIKit/UIKit.h>

@interface UIApplication (XCExtension)

/** 👀 沙盒中 Documents 的全路径 👀 */
@property (copy, nonatomic, readonly) NSString *documentsPath;

/** 👀 沙盒中 Caches 的全路径 👀 */
@property (copy, nonatomic, readonly) NSString *cachesPath;

/** 👀 沙盒中 Library 的全路径 👀 */
@property (copy, nonatomic, readonly) NSString *libraryPath;

/** 👀 App 的 BundleName 👀 */
@property (copy, nonatomic, readonly) NSString *appBundleName;

/** 👀 App 的 BundleID 👀 */
@property (copy, nonatomic, readonly) NSString *appBundleID;

/** 👀 App 的 BundelVersion(Build 版本号) 👀 */
@property (copy, nonatomic, readonly) NSString *appBundleVersion;

/** 👀 App 的 appBundleShortVersion(Version 版本号) 👀 */
@property (copy, nonatomic, readonly) NSString *appBundleShortVersion;


/** 👀 App 的展示名称 👀 */
@property (copy, nonatomic, readonly) NSString *appDisplayName;


@end
