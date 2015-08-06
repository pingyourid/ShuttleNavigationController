//
//  UIView+Extension.m
//  HJFramework
//
//  Created by bibibi on 15/7/20.
//  Copyright (c) 2015年 ihome. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (CGFloat)hj_left
{
    return self.frame.origin.x;
}

- (void)setHj_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)hj_top
{
    return self.frame.origin.y;
}

- (void)setHj_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)hj_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setHj_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)hj_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setHj_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)hj_centerX
{
    return self.center.x;
}

- (void)setHj_centerX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)hj_centerY
{
    return self.center.y;
}

- (void)setHj_centerY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)hj_width
{
    return self.frame.size.width;
}

- (void)setHj_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)hj_height
{
    return self.frame.size.height;
}

- (void)setHj_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end
