//
//  FirstNew.m
//  MsgForward
//
//  Created by wangrui on 2017/8/4.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "FirstAdd.h"
#import <objc/runtime.h>

@implementation FirstAdd

- (void)helloWorld
{
    NSLog(@"hello world");
}

// 使用 resolveInstanceMethod: 动态方法解析的前提是：动态新增的方法必须已经实现过了
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(printFirstAdd))
    {
        IMP methodAddress = [self instanceMethodForSelector:@selector(helloWorld)];
        class_addMethod(self, sel, methodAddress, "v@:");    
        return YES;
    }
    return NO;
}

@end
