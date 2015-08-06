//
//  HJVCAnimation.h
//  CommonLib
//
//  Created by bibibi on 15/7/22.
//  Copyright (c) 2015年 ihome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UIView+Extension.h"

typedef void (^CompleteBlock)(BOOL finished);

@interface HJVCAnimation : NSObject <UIViewControllerAnimatedTransitioning>

/**
 The direction of the animation.
 */
@property (nonatomic, assign) BOOL reverse;

/**
 The animation duration.
 */
@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, copy) CompleteBlock comleteBlock;

@end
