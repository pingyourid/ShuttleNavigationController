//
//  HJNC.m
//  HJFramework
//
//  Created by bibibi on 15/7/20.
//  Copyright (c) 2015年 ihome. All rights reserved.
//

#import "HJNC.h"
#import "HJNCDelegate.h"
#import "HJVCHolder.h"
#import <objc/runtime.h>

@interface HJNC ()

@property (nonatomic, strong) HJNCDelegate *customAnimationDelegate;
@property (nonatomic, strong) HJVCHolder *vcHolder;
@property (nonatomic, assign) BOOL enableInteractivePush;

@end

@implementation HJNC

- (HJNC *)initWithRootViewController:(UIViewController *)vc enableInteractivePush:(BOOL)enableInteractivePush
{
    self = [super init];
    if (self) {
        self.enableInteractivePush = enableInteractivePush;
    }
    [self setViewControllers:@[ vc ]];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.customAnimationDelegate = [HJNCDelegate new];
    self.customAnimationDelegate.ownerNC = self;
    self.delegate = self.customAnimationDelegate;

    if (self.enableInteractivePush) {
        self.vcHolder = [[HJVCHolder alloc] init];
    }

    [self prepareGestureRecognizer];
}

- (void)dealloc
{
    _completeBlock = nil;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.customAnimationDelegate.comleteBlock = self.completeBlock;

    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    self.customAnimationDelegate.comleteBlock = self.completeBlock;

    return [super popViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.customAnimationDelegate.comleteBlock = self.completeBlock;

    return [super popToViewController:viewController animated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    self.customAnimationDelegate.comleteBlock = self.completeBlock;

    return [self popToRootViewControllerAnimated:animated];
}

- (void)prepareGestureRecognizer
{
    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    UIView *gestureView = gesture.view;

    //pop
    UIScreenEdgePanGestureRecognizer *popRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self.customAnimationDelegate action:NSSelectorFromString(@"handleEdgePanGestureRecognizer:")];
    popRecognizer.delegate = self.customAnimationDelegate;
    popRecognizer.edges = UIRectEdgeLeft;
    objc_setAssociatedObject(popRecognizer, @"direction", @"pop", OBJC_ASSOCIATION_COPY);
    [gestureView addGestureRecognizer:popRecognizer];

    if (self.enableInteractivePush) {
        //push
        UIScreenEdgePanGestureRecognizer *pushRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self.customAnimationDelegate action:NSSelectorFromString(@"handleEdgePanGestureRecognizer:")];
        pushRecognizer.delegate = self.customAnimationDelegate;
        pushRecognizer.edges = UIRectEdgeRight;
        objc_setAssociatedObject(pushRecognizer, @"direction", @"push", OBJC_ASSOCIATION_COPY);
        [gestureView addGestureRecognizer:pushRecognizer];
    }
}

@end
