//
//  BViewController.m
//  NSTimerDemo
//
//  Created by YZY on 2018/11/22.
//  Copyright © 2018 ZMJ. All rights reserved.
//

#import "BViewController.h"
#import "WeakTimerImpl.h"

@interface BViewController (){
    WeakTimerImpl *_weakTimerImpl;
}

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    // 循环引用了
//    [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector(sayhaha) userInfo: nil repeats: YES];
    
    // 不会循环引用
    _weakTimerImpl = [[WeakTimerImpl alloc] initWithTimeInterval: 1 target: self selector: @selector(sayhaha) userInfo: nil repeats: YES];
}

- (void)sayhaha {
    NSLog(@"haha");
}

- (void)dealloc {
    NSLog(@"b dealloc");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated: YES completion: nil];
}


@end
