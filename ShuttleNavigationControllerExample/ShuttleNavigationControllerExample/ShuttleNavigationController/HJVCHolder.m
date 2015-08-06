//
//  HJVCHolder.m
//  CommonLib
//
//  Created by bibibi on 15/7/28.
//  Copyright (c) 2015年 ihome. All rights reserved.
//

#import "HJVCHolder.h"

@interface HJVCHolder ()

@property (nonatomic, strong) NSMutableArray *vcArr;

@end

@implementation HJVCHolder

- (NSMutableArray *)vcArr
{
    if (!_vcArr) {
        _vcArr = @[].mutableCopy;
    }
    return _vcArr;
}

- (void)removeToVC:(UIViewController *)vc
{
    NSMutableArray *resultArr = @[].mutableCopy;
    NSArray *arr = self.vcArr.copy;
    if ([self.vcArr containsObject:vc]) {
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
          if (obj == vc) {
              *stop = YES;
          }
          else {
              [resultArr addObject:obj];
          }
        }];
    }

    self.vcArr = resultArr;
}

- (void)addVC:(UIViewController *)vc
{
    [self.vcArr addObject:vc];
}

- (UIViewController *)lastVC
{
    return self.vcArr.lastObject;
}

@end
