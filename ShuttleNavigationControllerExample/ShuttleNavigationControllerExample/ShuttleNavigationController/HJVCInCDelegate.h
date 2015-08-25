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
 *  是否能左滑前进
 */
@property (nonatomic) BOOL canDragPush;

/**
 *  动画name
 */
@property (nonatomic) NSString *animationName;

@end
