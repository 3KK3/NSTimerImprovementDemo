//
//  WeakTimerImpl.m
//  NSTimerDemo
//
//  Created by YZY on 2018/11/22.
//  Copyright © 2018 ZMJ. All rights reserved.
//

#import "WeakTimerImpl.h"

@interface WeakTimerImpl ()
{
    SEL _selector;
}
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) NSObject *weakTarget;
@end

@implementation WeakTimerImpl

- (instancetype)initWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo  {
    self = [super init];
    if (self) {
        self.weakTarget = aTarget;
        _selector = aSelector;
        NSTimer * timer = [NSTimer timerWithTimeInterval: ti target: self selector: @selector(timerAction) userInfo: userInfo repeats: yesOrNo];
        [[NSRunLoop currentRunLoop] addTimer: timer forMode: NSDefaultRunLoopMode];
        self.timer = timer;
    }
    return self;
}


- (void)timerAction {
    if (self.weakTarget) {
        [self.weakTarget performSelectorInBackground: _selector withObject: nil];
    } else {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)dealloc {
    NSLog(@"✨🌛");
}








@end
