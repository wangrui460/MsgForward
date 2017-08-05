//
//  main.m
//  MsgForward
//
//  Created by wangrui on 2017/8/4.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstAdd.h"
#import "SecondFind.h"
#import "ThirdInvocation.h"

// IMP:一个函数指针,保存了方法的地址
// 关于生成签名的类型"v@:"解释一下。每一个方法会默认隐藏两个参数，self、_cmd，self代表方法调用者，_cmd代表这个方法的SEL，签名类型就是用来描述这个方法的返回值、参数的，v代表返回值为void，@表示self，:表示_cmd
// 更多类型编码请查看：https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //  测试消息转发第一步：动态方法解析
//        FirstAdd *first = [FirstAdd new];
//        [first printFirstAdd];
        
        // 测试消息转发第二步：寻找备援接收者
//        [SecondFind printSecondFind];     // 类方法不走 forwardingTargetForSelector: 方法
//        SecondFind *second = [SecondFind new];
//        [second printSecondFind];
        
        // 测试消息转发第三步：启动完整的消息转发机制
        ThirdInvocation *third = [ThirdInvocation new];
        [third performSelector:@selector(printThirdInvocation)];
    }
    return 0;
}
