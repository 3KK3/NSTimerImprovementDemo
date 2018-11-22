//
//  WeakTimerImpl.h
//  NSTimerDemo
//
//  Created by YZY on 2018/11/22.
//  Copyright © 2018 ZMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakTimerImpl : NSObject

- (instancetype)initWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end

NS_ASSUME_NONNULL_END
