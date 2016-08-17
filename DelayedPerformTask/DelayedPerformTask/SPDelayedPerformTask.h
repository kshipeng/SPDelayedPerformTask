//
//  SPDelayedPerformTask.h
//  SPAlert
//
//  Created by 康世朋 on 16/8/17.
//  Copyright © 2016年 SP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPDelayedPerformTask : NSObject

+ ( SPDelayedPerformTask * _Nonnull)shareInstance;
- (void)addPerformSelector:(nonnull SEL)select target:(nonnull id)target afterDelay:(NSTimeInterval)delay;
- (void)addPerformSelector:(nonnull SEL)select target:(nonnull id)target afterDelay:(NSTimeInterval)delay repeats:(BOOL)yesOrNo;
@end
