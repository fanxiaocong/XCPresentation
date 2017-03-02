//
//  UITableView+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (XCExtension)

/**
 *  将 tableView 滚动到指定的位置
 *
 *  @param row            指定的行
 *  @param section        指定的组
 *  @param scrollPosition 滚动到指定位置的具体方位（上、中、下）
 *  @param animated       动画
 */
- (void)scrollToRow:(NSUInteger)row
          inSection:(NSUInteger)section
   atScrollPosition:(UITableViewScrollPosition)scrollPosition
           animated:(BOOL)animated;

/**
 *  插入指定的某一行
 *
 *  @param row              指定的行
 *  @param section          指定的组
 *  @param animation        动画
 */
- (void)insertRow:(NSUInteger)row
        inSection:(NSUInteger)section
 withRowAnimation:(UITableViewRowAnimation)animation;


/**
 *  刷新指定的某一行
 *
 *  @param row       指定的行
 *  @param section   指定的组
 *  @param animation 动画
 */
- (void)reloadRow:(NSUInteger)row
        inSection:(NSUInteger)section
 withRowAnimation:(UITableViewRowAnimation)animation;


/**
 *  删除指定的某一行
 *
 *  @param row       指定的行
 *  @param section   指定的组
 *  @param animation 动画
 */
- (void)deleteRow:(NSUInteger)row
        inSection:(NSUInteger)section
 withRowAnimation:(UITableViewRowAnimation)animation;


/**
 *  插入指定的某一组
 *
 *  @param section   指定的某一组
 *  @param animation 动画
 */
- (void)insertSection:(NSUInteger)section
     withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  删除指定的某一组
 *
 *  @param section   指定的某一组
 *  @param animation 动画
 */
- (void)deleteSection:(NSUInteger)section
     withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  刷新指定的某一组
 *
 *  @param section   指定的某一组
 *  @param animation 动画
 */
- (void)reloadSection:(NSUInteger)section
     withRowAnimation:(UITableViewRowAnimation)animation;

@end
