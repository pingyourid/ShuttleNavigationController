//
//  HJVCVerticalAnimation.m
//  CommonLib
//
//  Created by bibibi on 15/7/24.
//  Copyright (c) 2015年 ihome. All rights reserved.
//

#import "HJVCVerticalAnimation.h"

@implementation HJVCVerticalAnimation

static CGFloat lowAlpha = 0.4;

- (id)init
{
    if (self = [super init]) {
        self.duration = 0.35f;
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView
{

    //转场动画是两个控制器视图时间的动画，需要一个containerView来作为一个“舞台”，让动画执行。
    UIView *containerView = [transitionContext containerView];

    if (self.reverse) { //pop
        //初始状态
        [containerView insertSubview:toView belowSubview:fromView];
        toView.alpha = lowAlpha;

        NSTimeInterval duration = [self transitionDuration:transitionContext];
        //执行动画，我们让fromVC的视图移动到屏幕最右侧
        [UIView animateWithDuration:duration
            delay:0
            options:UIViewAnimationOptionCurveLinear
            animations:^{
              fromView.hj_top = [[UIScreen mainScreen] bounds].size.width;
              toView.alpha = 1.0;
            }
            completion:^(BOOL finished) {
              //当你的动画执行完成，这个方法必须要调用，否则系统会认为你的其余任何操作都在动画执行过程中。
              [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
              if (self.comleteBlock) {
                  self.comleteBlock(!transitionContext.transitionWasCancelled);
              }
            }];
    }
    else {
        [containerView insertSubview:toView aboveSubview:fromView];
        toView.hj_top = [[UIScreen mainScreen] bounds].size.width;
        fromView.alpha = 1.0;

        NSTimeInterval duration = [self transitionDuration:transitionContext];

        [UIView animateWithDuration:duration
            animations:^{
              toView.hj_top = 0;
              fromView.alpha = lowAlpha;
            }
            completion:^(BOOL finished) {
              [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
              if (self.comleteBlock) {
                  self.comleteBlock(!transitionContext.transitionWasCancelled);
              }
            }];
    }
}

@end
