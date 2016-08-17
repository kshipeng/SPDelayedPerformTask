//
//  SPDelayedPerformTask.m
//  SPAlert
//
//  Created by 康世朋 on 16/8/17.
//  Copyright © 2016年 SP. All rights reserved.
//

#import "SPDelayedPerformTask.h"

@interface SPDelayedPerformTask ()

@property (nonatomic, strong) NSThread *thread;

@end

@implementation SPDelayedPerformTask

+ (SPDelayedPerformTask *)shareInstance {
    static SPDelayedPerformTask *singal;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singal = [[self alloc]init];
        [singal thread];
    });
    return singal;
}

- (void)threadRunloopPoint:(id)__unused object{
    @autoreleasepool {
        [[NSThread currentThread] setName:@"changzhuThread"];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        // 这里主要是监听某个 port，目的是让这个 Thread 不会回收
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}


- (NSThread *)thread{
    
    if(!_thread){
        _thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadRunloopPoint:) object:nil];
        [_thread start];
    }
    return _thread;
    
}

- (void)addPerformSelector:(SEL)select target:(id)target afterDelay:(NSTimeInterval)delay {
    NSTimer *timer = [NSTimer timerWithTimeInterval:delay target:target selector:select userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)addPerformSelector:(SEL)select target:(id)target afterDelay:(NSTimeInterval)delay repeats:(BOOL)yesOrNo {
    NSTimer *timer = [NSTimer timerWithTimeInterval:delay target:target selector:select userInfo:nil repeats:yesOrNo];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

@end
