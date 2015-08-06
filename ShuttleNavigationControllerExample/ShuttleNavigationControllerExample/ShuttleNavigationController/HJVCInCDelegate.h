//
//  HJVCInCDelegate.h
//  ShuttleNavigationControllerExample
//
//  Created by bibibi on 15/8/7.
//  Copyright (c) 2015年 bibibi. All rights reserved.
//

@protocol HJVCInCDelegate <NSObject>

/**
 *  是否能右滑返回
 */
@property (nonatomic) BOOL canDragBack;

/**
 *  动画name
 */
@property (nonatomic) NSString *animationName;

@end
