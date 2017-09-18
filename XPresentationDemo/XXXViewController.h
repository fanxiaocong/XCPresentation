//
//  XXXViewController.h
//  XPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PresentStyle)
{
    PresentStyleBubble = 0,
    
    PresentStyleAlert,
    
    PresentStylePan,
    
    PresentStyleScale,
    
    PresentStyleExplode
};

@interface XXXViewController : UIViewController

@property (assign, nonatomic) PresentStyle presentStyle;

@end
