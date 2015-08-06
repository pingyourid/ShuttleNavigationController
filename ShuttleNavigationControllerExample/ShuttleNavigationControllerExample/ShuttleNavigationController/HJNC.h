//
//  HJNC.h
//  HJFramework
//
//  Created by bibibi on 15/7/20.
//  Copyright (c) 2015年 ihome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJNCDelegate.h"

@interface HJNC : UINavigationController

@property (nonatomic, copy) CompleteBlock completeBlock;

- (HJNC *)initWithRootViewController:(UIViewController *)vc enableInteractivePush:(BOOL)enableInteractivePush;

@end
