//
//  UIViewController+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "UIViewController+XCExtension.h"

@implementation UIViewController (XCExtension)

/**
 *  根据 StoryBoardID 和 控制器ID 实例化一个 控制器
 *
 *  @param storyBoardID     storyBoardID
 *  @param viewcontrollerID 控制器ID
 */
+ (instancetype)viewcontrollerWithStoryBoardID:(NSString *)storyBoardID viewcontrollerID:(NSString *)viewcontrollerID;
{
    UIViewController *vc = [[UIStoryboard storyboardWithName:storyBoardID bundle:nil] instantiateViewControllerWithIdentifier:viewcontrollerID];
    return vc;
}

@end
