//
//  SecondFind.m
//  MsgForward
//
//  Created by wangrui on 2017/8/4.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "SecondFind.h"

@implementation SecondFind

+ (BOOL)resolveClassMethod:(SEL)sel
{
    return NO;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    return NO;
}

// 寻找备援接收者
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (aSelector == @selector(printSecondFind))
    {
        return [OtherClass new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end


@implementation OtherClass

+ (void)printSecondFind
{
    NSLog(@"我是备援接收者，我可以处理 printSecondFind 方法");
}
- (void)printSecondFind
{
    NSLog(@"我是备援接收者，我可以处理 printSecondFind 方法");
}
@end
