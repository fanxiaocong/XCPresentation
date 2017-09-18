//
//  XXXViewController.m
//  XCPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XXXViewController.h"

@interface XXXViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation XXXViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    switch (self.presentStyle)
    {
        case PresentStyleBubble:
        {
            self.view.backgroundColor = [UIColor colorWithRed:190.0/255 green:40/255.0 blue:19/255.0 alpha:1];
            break;
        }
        case PresentStyleAlert:
        {
            self.preferredContentSize = CGSizeMake(300, 300);
            self.view.backgroundColor = [UIColor whiteColor];
            self.view.layer.cornerRadius  = 5;
            self.view.layer.masksToBounds = YES;
            break;
        }
        case PresentStylePan:
        {
            self.view.backgroundColor = [UIColor colorWithRed:190.0/255 green:40/255.0 blue:19/255.0 alpha:1];
            self.preferredContentSize = CGSizeMake(300, 300);
            self.view.layer.cornerRadius = 5;
            self.view.layer.masksToBounds = YES;
            break;
        }
        case PresentStyleScale:
        case PresentStyleExplode:
        {
            break;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.presentStyle == PresentStyleScale)
    {
        self.imgView.hidden = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.presentStyle == PresentStyleScale)
    {
        self.imgView.hidden = NO;
    }
}

#pragma mark - 🎬 👀 Action Method 👀

- (IBAction)didClickBackButtonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
