//
//  UIView+Extension.h
//  HJFramework
//
//  Created by bibibi on 15/7/20.
//  Copyright (c) 2015年 ihome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat hj_left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat hj_top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat hj_right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat hj_bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat hj_width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat hj_height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat hj_centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat hj_centerY;

@end
