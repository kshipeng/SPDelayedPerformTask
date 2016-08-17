//
//  ViewController.m
//  DelayedPerformTask
//
//  Created by 康世朋 on 16/8/17.
//  Copyright © 2016年 SP. All rights reserved.
//

#import "ViewController.h"
#import "SPDelayedPerformTask.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SPDelayedPerformTask *sptask = [SPDelayedPerformTask shareInstance];
    [sptask addPerformSelector:@selector(time) target:self afterDelay:2];
    
}

- (void)time {
    
    NSLog(@"任务执行完毕");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
