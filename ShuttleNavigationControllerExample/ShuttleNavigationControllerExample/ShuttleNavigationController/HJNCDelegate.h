//
//  HJNCDelegate.h
//  HJFramework
//
//  Created by bibibi on 15/7/20.
//  Copyright (c) 2015 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJVCAnimation.h"

@class HJNC;

@interface HJNCDelegate : NSObject <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

//nc
@property (nonatomic, weak) HJNC *ownerNC;
@property (nonatomic, copy) CompleteBlock comleteBlock;

@end
