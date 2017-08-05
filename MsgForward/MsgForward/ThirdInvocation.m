//
//  ThirdInvocation.m
//  MsgForward
//
//  Created by wangrui on 2017/8/4.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "ThirdInvocation.h"

@implementation ThirdInvocation

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return [super forwardingTargetForSelector:aSelector];
}

// 启动完整的消息转发，将消息有关的全部细节封装到 NSInvocation 对象中

// 1. 必须重写 methodSignatureForSelector: 方法，才会执行 forwardInvocation: 方法
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    // 返回方法签名
    if (aSelector == @selector(printThirdInvocation))
    {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}


// 2. 启动完整的消息转发
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    // 方式 1. 可通过改变 target 方法调用者 来完成消息转发
    // [anInvocation invokeWithTarget:[OtherObject new]];
    
    // 方式 2. 可通过改变 selector 选择子 来完成消息转发
     anInvocation.selector = @selector(printWangRui);
     [anInvocation invoke];
    
    // 方式 3. 可通过改变 参数个数 来完成消息转发
    // 暂没解决
//    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:@@"];
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
//    invocation.selector = @selector(printThirdInvocation);
//    NSString *parameter0 = @"我是参数0";
//    NSString *parameter1 = @"我是参数1";
//
//    [invocation setArgument:&parameter0 atIndex:2];
//    [invocation setArgument:&parameter1 atIndex:3];
//    NSLog(@"----- %@",NSStringFromSelector(invocation.selector));
//    [invocation invokeWithTarget:self];
}


- (void)printWangRui
{
    NSLog(@"启动完整的消息转发：可通过改变 selector 选择子 来完成消息转发");
}

- (void)printThirdInvocation:(id)parameter0
{
    NSLog(@"启动完整的消息转发：可通过改变 参数个数 来完成消息转发");
}

- (void)printThirdInvocation:(id)parameter0 :(id)parameter1
{
    NSLog(@"启动完整的消息转发：可通过改变 参数个数 来完成消息转发");
}

@end





@implementation OtherObject

- (void)printThirdInvocation
{
    NSLog(@"启动完整的消息转发：可通过改变 target 方法调用者 来完成消息转发");
}

@end


















