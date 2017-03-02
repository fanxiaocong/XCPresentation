//
//  UITableView+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "UITableView+XCExtension.h"

@implementation UITableView (XCExtension)

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
           animated:(BOOL)animated
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

/**
 *  刷新指定的某一行
 *
 *  @param row       指定的行
 *  @param section   指定的组
 *  @param animation 动画
 */
- (void)reloadRow:(NSUInteger)row
        inSection:(NSUInteger)section
 withRowAnimation:(UITableViewRowAnimation)animation
{
    NSIndexPath *toReload = [NSIndexPath indexPathForRow:row inSection:section];
    
    [self reloadRowsAtIndexPaths:@[toReload] withRowAnimation:animation];
}


/**
 *  插入指定的某一行
 *
 *  @param row          指定的行
 *  @param section      指定的组
 *  @param animated     动画
 */
- (void)insertRow:(NSUInteger)row
        inSection:(NSUInteger)section
 withRowAnimation:(UITableViewRowAnimation)animation
{
    NSIndexPath *toInsert = [NSIndexPath indexPathForRow:row inSection:section];
    [self insertRowsAtIndexPaths:@[toInsert] withRowAnimation:animation];
}


/**
 *  删除指定的某一行
 *
 *  @param row       指定的行
 *  @param section   指定的组
 *  @param animation 动画
 */
- (void)deleteRow:(NSUInteger)row
        inSection:(NSUInteger)section
 withRowAnimation:(UITableViewRowAnimation)animation
{
    NSIndexPath *toDelete = [NSIndexPath indexPathForRow:row inSection:section];
    [self deleteRowsAtIndexPaths:@[toDelete] withRowAnimation:animation];
}

/**
 *  插入指定的某一组
 *
 *  @param section   指定的某一组
 *  @param animation 动画
 */
- (void)insertSection:(NSUInteger)section
     withRowAnimation:(UITableViewRowAnimation)animation
{
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self insertSections:sections withRowAnimation:animation];
}

/**
 *  删除指定的某一组
 *
 *  @param section   指定的某一组
 *  @param animation 动画
 */
- (void)deleteSection:(NSUInteger)section
     withRowAnimation:(UITableViewRowAnimation)animation
{
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self deleteSections:sections withRowAnimation:animation];
}

/**
 *  刷新指定的某一组
 *
 *  @param section   指定的某一组
 *  @param animation 动画
 */
- (void)reloadSection:(NSUInteger)section
     withRowAnimation:(UITableViewRowAnimation)animation
{
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self reloadSections:sections withRowAnimation:animation];
}


@end
