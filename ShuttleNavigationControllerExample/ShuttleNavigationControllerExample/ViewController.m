//
//  ViewController.m
//  ShuttleNavigationControllerExample
//
//  Created by bibibi on 15/8/6.
//  Copyright (c) 2015年 bibibi. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)go1:(id)sender
{
    ViewController1 *vc = [ViewController1 new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)go2:(id)sender
{
    ViewController2 *vc = [ViewController2 new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
