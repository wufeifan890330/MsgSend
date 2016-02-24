//
//  Test01.m
//  ttt
//
//  Created by 吴非凡 on 16/2/24.
//  Copyright © 2016年 PCI. All rights reserved.
//

#import "Test01.h"
#import "Test02.h"
#import "AppDelegate.h"
#import <objc/runtime.h>
void test(id self, SEL _cmd)
{
    NSLog(@"test01");
}


@implementation Test01

+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == @selector(test)) {
//                // 该方法第一个参数为添加方法的类
//                // 第二个参数为方法的声明
//                // 第三个参数为方法的实现
//                // 第四个参数为方法的类型即TypeEncodings。从左到右依次为返回值类型、参数类型。可参考官方文档https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
//                class_addMethod([self class], aSEL, (IMP)test, "v@:");
//                return YES;
        return NO;
    }
    return [super resolveInstanceMethod:aSEL];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if(aSelector == @selector(test)){
//                // 这里我在另一个类中声明了一个test的方法用以测试
//                return [Test02 new];
        return self;
    }
    return [super forwardingTargetForSelector:aSelector];
}

// 消息转发
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if (anInvocation.selector == @selector(test)) {
        [anInvocation invokeWithTarget:[Test02 new]];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

// 返回方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    
//    //　签名对象记录着方法的参数和返回值的类型信息。
//    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
//    if (!signature) {
//        // 本例中，因为要将消息转发给Test02对象，因此我们直接实例化一个Test02对象，并获取其同名方法的签名，并返回
//        signature = [[Test02 new] methodSignatureForSelector:aSelector];
//    }
//    return signature;
    
//    return nil;
}

@end
