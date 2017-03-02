//
//  NSObject+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XCExtension)

/**
 *  给 NSObject 添加 KVO，通过 block 的方式进行回调
 *
 *  @param keyPath 被观察对象的属性
 *  @param block   属性发生改变时的回调
 */
- (void)addObserverForKeyPath:(NSString * _Nullable)keyPath
                        block:(void (^ _Nullable)( _Nonnull id obj, _Nullable id oldVal, _Nullable id newVal))block;

/** 移除对应属性的观察者 */
- (void)removeObserverBlocksForKeyPath:(NSString * _Nullable)keyPath;

/** 移除所有观察者 */
- (void)removeObserverBlocks;

@end
