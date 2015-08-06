//
//  HJNCDelegate.m
//  HJFramework
//
//  Created by bibibi on 15/7/20.
//  Copyright (c) 2015 HJ. All rights reserved.
//

#import "HJNCDelegate.h"
#import "HJVCHolder.h"
#import "HJNC.h"
#import "HJVCInCDelegate.h"
#import <objc/runtime.h>

@interface HJNC ()

@property (nonatomic, strong) HJVCHolder *vcHolder;

@end

@interface HJNCDelegate ()

//进度动画
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation HJNCDelegate

- (void)dealloc
{
    _comleteBlock = nil;
    _ownerNC = nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactiveTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    UIViewController *vc = operation == UINavigationControllerOperationPush ? toVC : fromVC;
    if ([vc conformsToProtocol:@protocol(HJVCInCDelegate)]) {
        id<HJVCInCDelegate> hjvc = (id<HJVCInCDelegate>)vc;
        if (hjvc.animationName) {
            HJVCAnimation *animation = [[NSClassFromString(hjvc.animationName) alloc] init];
            NSAssert(animation, @"animation must not be nil");
            animation.reverse = operation == UINavigationControllerOperationPop;
            animation.comleteBlock = ^(BOOL finished) {
              if (finished) {
                  if (operation == UINavigationControllerOperationPop) {
                      [self.ownerNC.vcHolder addVC:fromVC];
                  }
                  else {
                      [self.ownerNC.vcHolder removeToVC:toVC];
                  }
              }

              if (self.comleteBlock) {
                  self.comleteBlock(finished);
              }
            };

            return animation;
        }
    }

    if (![fromVC conformsToProtocol:@protocol(HJVCInCDelegate)] || ![toVC conformsToProtocol:@protocol(HJVCInCDelegate)]) {
        //非hjvc打破push链,删除所有缓存vc
        [self.ownerNC.vcHolder removeToVC:nil];
    }

    return nil;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([[self.ownerNC valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }

    BOOL isPush = NO;
    if ([objc_getAssociatedObject(gestureRecognizer, @"direction") isEqualToString:@"push"]) {
        isPush = YES;
    }

    if (!isPush) {
        if (self.ownerNC.viewControllers.count == 1) {
            return NO;
        }

        if ([self.ownerNC.topViewController conformsToProtocol:@protocol(HJVCInCDelegate)]) {
            id<HJVCInCDelegate> vc = (id)self.ownerNC.topViewController;
            if (vc.canDragBack) {
                return YES;
            }
        }
    }
    else {
        if (self.ownerNC.vcHolder.lastVC) {
            return YES;
        }
    }

    return NO;
}

- (void)handleEdgePanGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)recognizer
{
    BOOL isPush = NO;
    if ([objc_getAssociatedObject(recognizer, @"direction") isEqualToString:@"push"]) {
        isPush = YES;
    }

    CGFloat progress = [recognizer translationInView:recognizer.view].x / recognizer.view.bounds.size.width;
    if (isPush) { //push的时候最右边是0,所以会是负数
        progress = -progress;
    }

    /**
     *  稳定进度区间，让它在0.0（未完成）～1.0（已完成）之间
     */
    progress = MIN(1.0, MAX(0.0, progress));
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];

        if (isPush) {
            [self.ownerNC pushViewController:self.ownerNC.vcHolder.lastVC animated:YES];
        }
        else {
            [self.ownerNC popViewControllerAnimated:YES];
        }
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        [self.interactiveTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        /**
         *  手势结束时如果进度大于一半，那么就完成pop操作，否则重新来过。
         */
        if (progress > 0.5) {
            [self.interactiveTransition finishInteractiveTransition];
        }
        else {
            [self.interactiveTransition cancelInteractiveTransition];
        }

        self.interactiveTransition = nil;
    }
}

@end
