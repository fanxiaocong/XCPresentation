//
//  XCTextViewController.h
//  转场动画
//
//  Created by 樊小聪 on 2016/12/29.
//  Copyright © 2016年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, XCTextPresentStyle)
{
    XCTextPresentStyleCenter = 0,
    
    XCTextPresentStyleRight,
    
    XCTextPresentStyleBottom
};

@interface XCTextViewController : UIViewController

@property (assign, nonatomic) XCTextPresentStyle presentStyle;

@end
