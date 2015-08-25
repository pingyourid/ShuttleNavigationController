//
//  BaseViewController.m
//  ShuttleNavigationControllerExample
//
//  Created by bibibi on 15/8/7.
//  Copyright (c) 2015年 bibibi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
@synthesize
    canDragBack,
    canDragPush,
    animationName;

- (BOOL)canDragBack
{
    return YES;
}

- (BOOL)canDragPush
{
    return YES;
}

- (NSString *)animationName
{
    return @"HJVCNormalAnimation";
}

@end
