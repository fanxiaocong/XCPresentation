//
//  XCPresentationController.m
//  转场动画
//
//  Created by 樊小聪 on 2016/12/28.
//  Copyright © 2016年 樊小聪. All rights reserved.
//




/*
 *  备注：自定义转场方式 🐾
 */




#import "XCPresentation.h"

@interface XCPresentation () <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

/** 👀 蒙板视图 👀 */
@property (strong, nonatomic) UIView *maskView;
/** 👀 弹出样式 👀 */
@property (assign, nonatomic) XCPresentTransitionStyle style;

@end


@implementation XCPresentation

#pragma mark - 🔓 👀 Public Method 👀

/**
 显示一个 弹框视图控制器
 
 @param presentedViewController     目标控制器（最终要展示的控制器）
 @param presentingViewController    源控制器（是从哪个控制器推出的）
 @param style                       弹出的模式
 */
+ (void)presentWithPresentedViewController:(UIViewController *)presentedViewController
                  presentingViewController:(UIViewController *)presentingViewController
                              presentStyle:(XCPresentTransitionStyle)style
{
    XCPresentation *presentationController = [[XCPresentation alloc] initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController presentStyle:style];
    
    // 设置 转场的模式为 自定义
    presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
    // 设置 转场代理
    presentedViewController.transitioningDelegate  = presentationController;
    
    [presentingViewController presentViewController:presentedViewController animated:YES completion:NULL];
}

#pragma mark - 👀 Init Method 👀 💤

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController
                       presentingViewController:(UIViewController *)presentingViewController
                                   presentStyle:(XCPresentTransitionStyle)style
{
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController])
    {
        _style = style;

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
    _maskView = [[UIView alloc] init];
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
    // 显示 蒙板
    self.maskView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.maskView];
    
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    
    // 让蒙板的显示和隐藏带有动画
    self.maskView.alpha = .0f;
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        self.maskView.alpha = .4f;
        
    } completion:NULL];
}

/**
 进入转场 ---》转场过渡完成的时候调用
 */
- (void)presentationTransitionDidEnd:(BOOL)completed
{
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
    // 将蒙板视图 消失
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
        self.maskView.alpha = .0f;
        
    } completion:NULL];
}


/**
 退出转场 ---》完成的回调
 */
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    // 如果退出完成，将 蒙板 移除
    if (completed)
    {
        [self.maskView removeFromSuperview];
    }
}

#pragma mark - 👀 调整弹框视图的尺寸 👀 💤

- (UIView *)presentedView
{
    UIView *presentedView = self.presentedViewController.view;
    
    // 调整 弹出控制器的圆角效果
    switch (self.style)
    {
        case XCPresentTransitionStyleCenter:
        {
            // 从中间弹出
            presentedView.layer.cornerRadius  = 10.f;
            presentedView.layer.masksToBounds = YES;
            break;
        }
        default:
            break;
    }
    
    return presentedView;
}

/**
 返回最终要展现出来的视图的大小
 */
- (CGRect)frameOfPresentedViewInContainerView
{
    // 容器视图的 frame
    CGRect containerViewBounds = self.containerView.bounds;
    
    // 获取 presentedView 的 Size
    CGSize presentedViewSize = [self sizeForChildContentContainer:self.presentedViewController withParentContainerSize:containerViewBounds.size];
    
    CGFloat finalX = 0;
    CGFloat finalY = 0;
    CGFloat finalW = presentedViewSize.width;
    CGFloat finalH = presentedViewSize.height;
    
    switch (self.style)
    {
        case XCPresentTransitionStyleCenter:
        {
            // 中间
            finalX = CGRectGetMidX(containerViewBounds) - presentedViewSize.width * 0.5;
            finalY = CGRectGetMidY(containerViewBounds) - presentedViewSize.height * 0.5;
            break;
        }
        case XCPresentTransitionStyleRight:
        {
            // 从右往左
            finalX = CGRectGetWidth(containerViewBounds) - finalW;
            break;
        }
        case XCPresentTransitionStyleBottom:
        {
            // 从下往上
            finalY = CGRectGetHeight(containerViewBounds) - finalH;
            break;
        }
    }
    
    return CGRectMake(finalX, finalY, finalW, finalH);
}

/**
 获取 presentedView 的 Size
 */
- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize
{
    // 目标控制器（最终展示出来的控制器）充当子容器
    if (container == self.presentedViewController)
    {
        // 返回 目标控制器的 preferredContentSize
        return ((UIViewController *)container).preferredContentSize;
    }
    
    return [super sizeForChildContentContainer:container withParentContainerSize:parentSize];
}


/**
 当 preferredContentSize 发生改变之后，进行重新 布局
 */
- (void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container
{
    [super preferredContentSizeDidChangeForChildContentContainer:container];
    
    // 目标控制器（最终展示出来的控制器）充当子容器
    if (container == self.presentedViewController)
    {
        // 当 目标控制器的 preferredContentSize 发生改变之后，重新布局
        [self.containerView setNeedsLayout];
    }
}

#pragma mark - 💉 👀 UIViewControllerAnimatedTransitioning 👀

/**
 转场所需的时间
 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .25f;
}

/**
 动画的具体实现
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 目标控制器
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 源控制器
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // 目标视图
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    // 源视图
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    // 容器视图：动画执行的场所
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    
    // 判断是否是 进入转场
    BOOL isPresenting = (fromViewController == self.presentingViewController);
    
    // 源视图的初始尺寸
//    CGRect fromViewInitialF = [transitionContext initialFrameForViewController:fromViewController];
    // 源视图的最终尺寸
    CGRect fromViewFinalF   = [transitionContext finalFrameForViewController:fromViewController];
    
    // 目标视图的初始尺寸
    CGRect toViewInitialF   = [transitionContext initialFrameForViewController:toViewController];
    // 目标视图的最终尺寸
    CGRect toViewFinalF     = [transitionContext finalFrameForViewController:toViewController];
    
    switch (self.style)
    {
        case XCPresentTransitionStyleCenter:
        {
            // 中间弹出
            toView.frame = toViewFinalF;
            
            if (isPresenting)
            {
                // 如果是 进入转场 ---> 目标视图的初始状态
                toView.alpha = 0;
                toView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            }
            
            break;
        }
        case XCPresentTransitionStyleRight:
        {
            // 从右往左
            if (isPresenting)
            {
                // 进入转场
                toViewInitialF.origin = CGPointMake(CGRectGetMaxX(containerView.bounds), CGRectGetMinY(containerView.bounds));
                toViewInitialF.size   = toViewFinalF.size;
                toView.frame = toViewInitialF;
            }
            else
            {
                // 退出转场
                fromViewFinalF.origin = CGPointMake(CGRectGetMaxX(containerView.bounds), CGRectGetMinY(containerView.bounds));
            }
            
            break;
        }
        case XCPresentTransitionStyleBottom:
        {
            // 从下往上
            if (isPresenting)
            {
                // 进入转场
                toViewInitialF.origin = CGPointMake(CGRectGetMinX(containerView.bounds), CGRectGetMaxY(containerView.bounds));
                toViewInitialF.size   = toViewFinalF.size;
                toView.frame = toViewInitialF;
            }
            else
            {
                // 退出转场
                fromViewFinalF.origin = CGPointMake(CGRectGetMinX(containerView.bounds), CGRectGetMaxY(containerView.bounds));
            }
            
            break;
        }
    }
    
    // 动画开始
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        // 动画的过程
        switch (self.style)
        {
            case XCPresentTransitionStyleCenter:
            {
                // 中间弹出
                if (isPresenting)
                {
                    // 如果是 进入转场 ---> 目标视图的初始状态
                    toView.alpha = 1;
                    toView.transform = CGAffineTransformMakeScale(1.f, 1.f);
                }
                else
                {
                    // 退出转场
                    fromView.alpha = 0;
                }
                
                break;
            }
            case XCPresentTransitionStyleRight:
            case XCPresentTransitionStyleBottom:
            {
                // 从右往左
                // 从下往上
                if (isPresenting)
                {
                    // 进入转场
                    toView.frame = toViewFinalF;
                }
                else
                {
                    // 退出转场
                    fromView.frame = fromViewFinalF;
                }
                
                break;
            }
        }
        
    } completion:^(BOOL finished) {
        
        // 动画完成
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}

#pragma mark - 💉 👀 UIViewControllerTransitioningDelegate 👀

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

#pragma mark - 🎬 👀 Action Method 👀

/**
 点击了蒙板的回调
 */
- (void)maskViewDidClickAction
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:NULL];
}

@end
































