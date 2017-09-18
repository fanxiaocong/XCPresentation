//
//  XPresentation.m
//  XPresentationDemo
//
//  Created by 樊小聪 on 2017/9/16.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XPresentation.h"


@interface XPresentation ()<UIViewControllerTransitioningDelegate>

/** 👀 蒙板视图 👀 */
@property (strong, nonatomic) UIView *maskView;
/** 👀 动画类 👀 */
@property (strong, nonatomic) XPresentationAnimation *presentationAnimation;

@end


@implementation XPresentation

#pragma mark - 🔓 👀 Public Method 👀

/**
 *  显示一个 弹框视图控制器
 *
 *  @param presentationAnimation    动画类
 *  @param presentedViewController  目标控制器（最终要展示的控制器）
 *  @param presentingViewController 源控制器（是从哪个控制器推出的
 */
+ (void)presentWithPresentationAnimation:(XPresentationAnimation *)presentationAnimation
                 presentedViewController:(UIViewController *)presentedViewController
                presentingViewController:(UIViewController *)presentingViewController
{
    XPresentation *presentation = [[XPresentation alloc] initWithPresentationAnimation:presentationAnimation presentedViewController:presentedViewController presentingViewController:presentingViewController];
    
    // 设置 转场的模式为 自定义
    presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
    // 设置 转场代理
    presentedViewController.transitioningDelegate  = presentation;
    
    [presentingViewController presentViewController:presentedViewController animated:YES completion:NULL];
}

#pragma mark - 👀 Init Method 👀 💤

- (instancetype)initWithPresentationAnimation:(XPresentationAnimation *)presentationAnimation
                      presentedViewController:(UIViewController *)presentedViewController
                     presentingViewController:(UIViewController *)presentingViewController
{
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController])
    {
        _presentationAnimation = presentationAnimation;
        
        // 设置 默认参数
        [self setupDefaults];
    }
    
    return self;
}


/**
 设置 默认参数
 */
- (void)setupDefaults
{
    // 添加蒙板视图
    UIView *maskView = [[UIView alloc] init];
    _maskView = maskView;
    _maskView.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewDidClickAction)];
    [_maskView addGestureRecognizer:tap];
}

#pragma mark - ⏳ 👀 LifeCycle Method 👀

/**
 进入转场 ---》转场过渡即将开始的时候调用
 */
- (void)presentationTransitionWillBegin
{
    if ([self needRemovePresentersView])
    {
        self.maskView.hidden = YES;
        return;
    }
        
    // 显示 蒙板
    self.maskView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.maskView];
    
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    
    // 让蒙板的显示和隐藏带有动画
    self.maskView.alpha = .0f;
    
    __weak typeof (self)weakSelf = self;
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        weakSelf.maskView.alpha = .4f;
        
    } completion:NULL];
}

/**
 进入转场 ---》转场过渡完成的时候调用
 */
- (void)presentationTransitionDidEnd:(BOOL)completed
{
    if ([self needRemovePresentersView])       return;
    
    // 如果转场没有完成：转场失败 ---》 移除蒙板
    if (!completed)
    {
        [self.maskView removeFromSuperview];
    }
}

/**
 退出转场 ---》将要开始的时候调用
 */
- (void)dismissalTransitionWillBegin
{
    if ([self needRemovePresentersView])       return;
    
    // 将蒙板视图 消失
    __weak typeof (self)weakSelf = self;
    
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        weakSelf.maskView.alpha = .0f;
        
    } completion:NULL];
}


/**
 退出转场 ---》完成的回调
 */
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if ([self needRemovePresentersView])       return;
    
    // 如果退出完成，将 蒙板 移除
    if (completed)
    {
        [self.maskView removeFromSuperview];
    }
}

/**
 *  转场结束后，移除相关视图
 */
- (BOOL)shouldRemovePresentersView
{
   return [self needRemovePresentersView];
}

#pragma mark - 🎬 👀 Action Method 👀

/**
 点击了蒙板的回调
 */
- (void)maskViewDidClickAction
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  是否需要移除
 */
- (BOOL)needRemovePresentersView
{
    /**
     *  注意：这个地方根据 present 出来的视图尺寸与当前屏幕显示出来的尺寸进行对比，如果相同，则表示全屏显示，需要移除 presentersView；如果不同，则表示不能移除 presentersView
     */
    return CGSizeEqualToSize(self.presentedViewController.preferredContentSize, CGSizeZero);
}

#pragma mark - 💉 👀 UIViewControllerTransitioningDelegate 👀

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.presentationAnimation.style = XPresentationAnimationStylePresent;
    return self.presentationAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.presentationAnimation.style = XPresentationAnimationStyleDismiss;
    return self.presentationAnimation;
}

@end

