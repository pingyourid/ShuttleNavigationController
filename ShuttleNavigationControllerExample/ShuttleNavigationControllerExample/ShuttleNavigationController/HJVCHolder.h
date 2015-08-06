//
//  HJVCHolder.h
//  CommonLib
//
//  Created by bibibi on 15/7/28.
//  Copyright (c) 2015年 ihome. All rights reserved.
//
//数组是:非常远 远 近 最近的顺序

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HJVCHolder : NSObject

/**
 *  从后往前删除到vc(包括),如果找不到，全部删除
 *
 *  @param vc
 */
- (void)removeToVC:(UIViewController *)vc;

/**
 *  增加vc(单独)
 *
 *  @param vc
 */
- (void)addVC:(UIViewController *)vc;

/**
 *  最后一个vc
 *
 *  @return
 */
- (UIViewController *)lastVC;

@end
